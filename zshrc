# Plugins are listed in ~/.zsh_plugins.txt
ZSH_THEME=half-life
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

[ -f ~/.aliases ] && source ~/.aliases

# Ensure dotfiles bin directory is loaded first
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Gangway tab completion
[ -f "$HOME/.config/gangway/completions.zsh" ] && source "$HOME/.config/gangway/completions.zsh"
