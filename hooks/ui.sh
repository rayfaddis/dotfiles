# Shared output helpers for the rcm hooks. Sourced, not executed.
#
#   ui_step "Label" some_function   run with a spinner, log output, print result
#   ui_detail "text"                from inside a step: short note for its result line
#   ui_item add|up|fail|same "text" from inside a step: a line listed under its result
#   ui_skip "Label" "reason"        record a step that had nothing to do
#
# Command output goes to $UI_LOG. Steps list everything by default; RCUP_VERBOSE=0
# lists only what changed (ui_verbose). RCUP_RAW=1 streams raw output instead.
# ui_flags prints these as a reminder at the end of a run.

UI_LOG="$HOME/Library/Logs/dotfiles/rcup.log"
UI_STATE="${TMPDIR:-/tmp}/dotfiles-rcup.state"
UI_DETAIL="${TMPDIR:-/tmp}/dotfiles-rcup.detail"
UI_ITEMS="${TMPDIR:-/tmp}/dotfiles-rcup.items"
UI_WIDTH=64

export LC_CTYPE="${LC_CTYPE:-en_US.UTF-8}"  # so ${#var} counts characters, not bytes
mkdir -p "$(dirname "$UI_LOG")"

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  UI_TTY=1
  c_reset=$'\e[0m' c_bold=$'\e[1m' c_dim=$'\e[2m'
  c_red=$'\e[31m' c_green=$'\e[32m' c_yellow=$'\e[33m'
  c_blue=$'\e[34m' c_magenta=$'\e[35m' c_cyan=$'\e[36m'
else
  UI_TTY=0
  c_reset='' c_bold='' c_dim='' c_red='' c_green='' c_yellow='' c_blue='' c_magenta='' c_cyan=''
fi

ui_repeat() { local s='' i; for ((i = 0; i < $2; i++)); do s+="$1"; done; printf '%s' "$s"; }

ui_duration() {
  local s=$1
  if [ "$s" -lt 60 ]; then printf '%ds' "$s"; else printf '%dm %02ds' $((s / 60)) $((s % 60)); fi
}

# Rounded box, at least UI_WIDTH wide and grown to fit the longest line. Lines are
# plain text; colors are applied here so padding stays right.
ui_box() {
  local color=$1 title=$2; shift 2
  local width=$UI_WIDTH line
  for line in "$@"; do
    [ $((${#line} + 4)) -gt "$width" ] && width=$((${#line} + 4))
  done
  local inner=$((width - 4))
  printf '%s╭─ %s%s%s %s╮%s\n' "$color" "$c_bold" "$title" "$c_reset$color" \
    "$(ui_repeat ─ $((width - ${#title} - 5)))" "$c_reset"
  # Pad by character count; printf's %-*s counts bytes and misaligns on "·".
  for line in "$@"; do
    printf '%s│%s %s%s %s│%s\n' "$color" "$c_reset" "$line" \
      "$(ui_repeat ' ' $((inner - ${#line})))" "$color" "$c_reset"
  done
  printf '%s╰%s╯%s\n' "$color" "$(ui_repeat ─ $((width - 2)))" "$c_reset"
}

ui_section() {
  printf '\n%s%s %s %s%s\n' "$c_bold$c_magenta" "──" "$1" "$(ui_repeat ─ $((UI_WIDTH - ${#1} - 4)))" "$c_reset"
}

ui_record() { printf '%s|%s|%s\n' "$1" "$2" "$3" >>"$UI_STATE"; }

ui_detail() { printf '%s' "$*" >"$UI_DETAIL"; }

ui_verbose() { [ "${RCUP_VERBOSE:-1}" != 0 ]; }

ui_flags() {
  printf '  %sOptions%s  %sRCUP_VERBOSE=0 rcup%s  list only what changed\n' "$c_bold" "$c_reset" "$c_cyan" "$c_reset"
  printf '           %sRCUP_RAW=1 rcup%s      stream raw command output\n' "$c_cyan" "$c_reset"
  printf '           %sNO_COLOR=1 rcup%s      plain text, no spinner\n' "$c_cyan" "$c_reset"
  printf '           %sRCUP_RELOAD=0 rcup%s   don'"'"'t restart the shell afterward\n' "$c_cyan" "$c_reset"
  printf '           %srcup -K%s              skip these hooks, just link\n\n' "$c_cyan" "$c_reset"
}

ui_item() { printf '%s|%s\n' "$1" "$2" >>"$UI_ITEMS"; }

ui_print_items() {
  local kind text icon color
  while IFS='|' read -r kind text; do
    case $kind in
      add) icon=+ color=$c_green ;;
      up) icon=↑ color=$c_cyan ;;
      fail) icon=✖ color=$c_red ;;
      *) icon=· color=$c_dim ;;
    esac
    printf '      %s%s%s %s%s%s\n' "$color" "$icon" "$c_reset" \
      "$([ "$kind" = same ] && printf '%s' "$c_dim")" "$text" "$c_reset"
  done <"$UI_ITEMS"
}

ui_result() {
  local icon=$1 color=$2 label=$3 secs=$4 detail=$5 time=''
  [ -n "$secs" ] && time=$(ui_duration "$secs")
  [ "$UI_TTY" -eq 1 ] && printf '\r\e[K'
  printf '  %s%s%s %-22s %s%7s%s  %s%s%s\n' \
    "$color" "$icon" "$c_reset" "$label" "$c_dim" "$time" "$c_reset" "$c_dim" "$detail" "$c_reset"
}

ui_spin() {
  local pid=$1 label=$2 start=$3 i=0
  local frames=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏)
  printf '\e[?25l'
  while kill -0 "$pid" 2>/dev/null; do
    printf '\r  %s%s%s %-22s %s%7s%s' "$c_cyan" "${frames[i++ % 10]}" "$c_reset" "$label" \
      "$c_dim" "$(ui_duration $((SECONDS - start)))" "$c_reset"
    sleep 0.1
  done
  printf '\e[?25h'
}

ui_step() {
  local label=$1; shift
  local start=$SECONDS status detail
  : >"$UI_DETAIL"
  : >"$UI_ITEMS"
  printf '\n==> %s\n' "$label" >>"$UI_LOG"

  if [ "${RCUP_RAW:-0}" = 1 ]; then
    printf '  %s▸%s %s%s%s\n' "$c_cyan" "$c_reset" "$c_bold" "$label" "$c_reset"
    "$@" 2>&1 | tee -a "$UI_LOG"
    status=${PIPESTATUS[0]}
  elif [ "$UI_TTY" -eq 1 ]; then
    "$@" >>"$UI_LOG" 2>&1 &
    local pid=$!
    ui_spin "$pid" "$label" "$start"
    wait "$pid"
    status=$?
  else
    "$@" >>"$UI_LOG" 2>&1
    status=$?
  fi

  local secs=$((SECONDS - start))
  detail=$(cat "$UI_DETAIL" 2>/dev/null)
  if [ "$status" -eq 0 ]; then
    ui_result ✔ "$c_green" "$label" "$secs" "$detail"
    ui_record ok "$label" "$secs"
    ui_print_items
  else
    ui_result ✖ "$c_red" "$label" "$secs" "${detail:-exit $status}"
    ui_record fail "$label" "$secs"
    ui_print_items
    # Show the tail of this step's log so the failure is visible without opening it.
    sed -n '/^==> '"$label"'$/,$p' "$UI_LOG" | tail -n 12 | sed "s/^/      ${c_dim}│${c_reset} /"
  fi
  return 0
}

ui_skip() {
  ui_result ○ "$c_yellow" "$1" '' "$2"
  ui_record skip "$1" 0
}

ui_cleanup() { [ "$UI_TTY" -eq 1 ] && printf '\e[?25h'; rm -f "$UI_DETAIL" "$UI_ITEMS"; }
trap ui_cleanup EXIT
trap 'ui_cleanup; exit 130' INT TERM
