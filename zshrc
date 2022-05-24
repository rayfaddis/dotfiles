source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle asdf
antigen bundle colorize
antigen bundle command-not-found
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle rails
antigen bundle ruby
antigen bundle vi-mode
antigen bundle zsh_reload
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme half-life

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

. /usr/local/opt/asdf/libexec/asdf.sh

export PATH=$HOME/.bin:$PATH # ensure dotfiles bin directory is loaded first

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"

unset ASDF_DIR
