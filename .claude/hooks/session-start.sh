#!/bin/bash
# SessionStart hook: provision the video-content pipeline for Claude Code on the web.
# Installs FFmpeg (assembly), HyperFrames (HTML->video, HeyGen open source), and
# the Whisper CLI (captions). Idempotent and non-interactive.
set -uo pipefail

# Only run in the remote (web) container; local Claude Code already has these.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

log() { echo "[pipeline-setup] $*" >&2; }

# Reuse the container's pre-installed Chromium so HyperFrames/Puppeteer don't fetch one.
CHROMIUM_BIN="$(ls /opt/pw-browsers/chromium*/chrome-linux/chrome 2>/dev/null | head -1 || true)"
if [ -n "$CHROMIUM_BIN" ] && [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  {
    echo "export PUPPETEER_SKIP_DOWNLOAD=true"
    echo "export PUPPETEER_EXECUTABLE_PATH=\"$CHROMIUM_BIN\""
    echo "export HYPERFRAMES_CHROME_PATH=\"$CHROMIUM_BIN\""
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
  } >> "$CLAUDE_ENV_FILE"
fi
export PUPPETEER_SKIP_DOWNLOAD=true
[ -n "$CHROMIUM_BIN" ] && export PUPPETEER_EXECUTABLE_PATH="$CHROMIUM_BIN"

# 1) FFmpeg + ffprobe (core assembly + probing) --------------------------------
if command -v ffmpeg >/dev/null 2>&1; then
  log "ffmpeg already present ($(ffmpeg -version | head -1))"
else
  log "installing ffmpeg via apt-get..."
  export DEBIAN_FRONTEND=noninteractive
  # Skip `apt-get update`: the container's cached lists already index ffmpeg, and
  # a full update aborts on unrelated third-party PPAs (deadsnakes/ondrej) that 403.
  if sudo apt-get install -y -qq ffmpeg; then
    log "ffmpeg installed ($(ffmpeg -version | head -1))"
  else
    log "WARNING: ffmpeg install failed"
  fi
fi

# 2) HyperFrames (HTML -> video, frame by frame) -------------------------------
if command -v hyperframes >/dev/null 2>&1; then
  log "hyperframes already present ($(hyperframes --version 2>/dev/null || echo installed))"
else
  log "installing hyperframes (npm global)..."
  # --ignore-scripts skips a transitive onnxruntime-node binary download (optional
  # ML matting adapter) that ECONNRESETs behind the proxy; the HTML->video core
  # (headless Chromium + FFmpeg) does not need it.
  if npm install -g hyperframes --ignore-scripts >/dev/null 2>&1; then
    log "hyperframes installed ($(hyperframes --version 2>/dev/null || echo ok))"
  else
    log "WARNING: hyperframes install failed"
  fi
fi

# 3) Whisper CLI (captions/transcription) — best effort, non-fatal -------------
if command -v whisper >/dev/null 2>&1; then
  log "whisper already present"
elif command -v uv >/dev/null 2>&1; then
  log "installing openai-whisper CLI via uv (best effort)..."
  if uv tool install openai-whisper >/dev/null 2>&1; then
    log "whisper installed"
  else
    log "NOTE: whisper install skipped/failed (optional — captions only)"
  fi
else
  log "NOTE: uv not found; skipping whisper (optional)"
fi

# Summary line goes to stdout so it lands in session context.
echo "Video pipeline ready: ffmpeg=$(command -v ffmpeg >/dev/null 2>&1 && echo yes || echo no), hyperframes=$(command -v hyperframes >/dev/null 2>&1 && echo yes || echo no), whisper=$(command -v whisper >/dev/null 2>&1 && echo yes || echo no)"
exit 0
