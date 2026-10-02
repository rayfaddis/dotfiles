# Plugins are listed in ~/.zsh_plugins.txt
ZSH_THEME=half-life
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

[ -f ~/.aliases ] && source ~/.aliases

# ensure dotfiles bin directory is loaded first
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
