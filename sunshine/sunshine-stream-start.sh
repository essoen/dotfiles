#!/usr/bin/env bash
set -u

LOG=/tmp/sunshine-res.log
PREV=${XDG_RUNTIME_DIR:-/tmp}/sunshine-prev-mode
OUT=DP-1

ts() { date '+%F %T'; }
log() { echo "[$(ts)] start: $*" >> "$LOG"; }

current_geometry() {
  kscreen-doctor -o 2>/dev/null \
    | sed 's/\x1b\[[0-9;]*m//g' \
    | awk -v out="$OUT" '
        /^Output:/ { found = ($0 ~ out) }
        found && /Geometry:/ {
          match($0, /[0-9]+x[0-9]+$/)
          print substr($0, RSTART, RLENGTH)
          exit
        }'
}

current_mode() {
  kscreen-doctor -o 2>/dev/null \
    | sed 's/\x1b\[[0-9;]*m//g' \
    | awk -v out="$OUT" '
        /^Output:/ { found = ($0 ~ out) }
        found && /Modes:/ {
          for (i = 1; i <= NF; i++) {
            if ($i ~ /\*/) {
              mode = $i
              sub(/^[0-9]+:/, "", mode)
              sub(/[!*]+$/, "", mode)
              sub(/\.[0-9]+$/, "", mode)
              print mode
              exit
            }
          }
        }'
}

try_set() {
  local mode=$1 want_wh=$2
  kscreen-doctor "output.${OUT}.mode.${mode}" >> "$LOG" 2>&1
  sleep 0.4
  local got
  got=$(current_geometry)
  if [[ "$got" == "$want_wh" ]]; then
    log "set mode=$mode OK (geometry=$got)"
    return 0
  fi
  log "set mode=$mode FAIL (geometry=$got expected=$want_wh)"
  return 1
}

W=${1:-${SUNSHINE_CLIENT_WIDTH:-1920}}
H=${2:-${SUNSHINE_CLIENT_HEIGHT:-1080}}
F=${3:-${SUNSHINE_CLIENT_FPS:-60}}
log "client=${W}x${H}@${F} pid=$$ args=$*"

prev=$(current_mode)
if [[ -n "$prev" ]]; then
  echo "$prev" > "$PREV"
  log "snapshot prev=$prev -> $PREV"
else
  log "WARN could not detect current mode"
fi

if try_set "${W}x${H}@${F}" "${W}x${H}"; then
  exit 0
fi

log "primary failed; falling back to 1920x1080@60"
try_set "1920x1080@60" "1920x1080" || log "ERROR all mode switches failed"
exit 0
