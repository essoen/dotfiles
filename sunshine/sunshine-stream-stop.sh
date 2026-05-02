#!/usr/bin/env bash
set -u

LOG=/tmp/sunshine-res.log
PREV=${XDG_RUNTIME_DIR:-/tmp}/sunshine-prev-mode
OUT=DP-1
FALLBACK="3840x1200@120"
FALLBACK_WH="3840x1200"

ts() { date '+%F %T'; }
log() { echo "[$(ts)] stop:  $*" >> "$LOG"; }

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

target=$(cat "$PREV" 2>/dev/null || true)
if [[ -z "$target" ]]; then
  target="$FALLBACK"
  log "no snapshot; using fallback=$target"
else
  log "restoring snapshot=$target"
fi

target_wh=${target%@*}

if try_set "$target" "$target_wh"; then
  rm -f "$PREV"
  exit 0
fi

log "snapshot restore failed; trying fallback=$FALLBACK"
if try_set "$FALLBACK" "$FALLBACK_WH"; then
  rm -f "$PREV"
  exit 0
fi

log "ERROR all restores failed"
exit 0
