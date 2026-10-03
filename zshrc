# Plugins are listed in ~/.zsh_plugins.txt
ZSH_THEME=half-life
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

[ -f ~/.aliases ] && source ~/.aliases

# Ensure dotfiles bin directory is loaded first
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# A child process can't restart the shell that ran it, so reload from here once
# rcup succeeds. RCUP_RELOAD=0 rcup skips it.
rcup() {
  RCUP_RELOAD=${RCUP_RELOAD:-1} command rcup "$@" || return
  [ "${RCUP_RELOAD:-1}" = 0 ] && return
  # reload comes from zsh-plugin-reload; fall back if plugins didn't load.
  if (( $+functions[reload] )); then reload; else exec zsh; fi
}

# Machine-specific config, not tracked in the repo. Keep this last so it can
# override anything above.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
