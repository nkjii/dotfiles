export PATH=/opt/homebrew/bin:$PATH

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
#setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
#\$ '
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH=$PATH:/Users/yuta-nakajima/Library/Android/sdk/platform-tools

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yuta-nakajima/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# コマンド履歴で過去の重複は削除 / 別セッションと履歴を共有
setopt histignorealldups sharehistory
# 永続化する履歴ファイルのパスを指定
HISTFILE=~/.zsh_history
# シェル実行中にメモリへ保存するコマンド履歴の最大数
HISTSIZE=1000
# .zsh_historyに書きこまれるコマンド履歴の最大数
SAVEHIST=1000

# オートコンプリート
autoload -Uz compinit
compinit

# 高度な補完
zstyle ':completion:*' completer _expand _complete _correct _approximate
# 大文字小文字や各種記号をfuzzyに考慮して補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# ドットファイルを.はじまりでなくても補完
setopt globdots

# alias
alias gits="git stash"
alias gitsp="git stash pop"
alias awsproxy='ssh 10.129.0.249'
alias opproxy='ssh 10.49.254.247'
alias nass-dev='ssh 10.49.254.247'
alias ll='ls -l'

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

#poetry
export PATH="/Users/yuta-nakajima/.local/bin:$PATH"

#mecab
export MECABRC=/usr/local/etc/mecabrc

#nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init zsh --hook prompt )"
eval "$(starship init zsh)"
