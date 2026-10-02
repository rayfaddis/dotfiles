# Plugins are listed in ~/.zsh_plugins.txt
ZSH_THEME=half-life
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

# ensure dotfiles bin directory is loaded first
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export ANDROID_SDK=$HOME/Library/Android/sdk

# export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/redis@6.2/bin:$PATH"
