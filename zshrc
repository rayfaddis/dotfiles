source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found
antigen bundle asdf
antigen bundle colorize
antigen bundle zsh_reload
antigen bundle rails
antigen bundle ruby
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme half-life

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
