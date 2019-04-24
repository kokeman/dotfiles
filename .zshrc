# zplug settings
source ~/.zplug/init.zsh

# plugins
# 補完
zplug 'zsh-users/zsh-completions'
# 色付け
zplug "zsh-users/zsh-syntax-highlighting"
# 履歴からコマンドを提案
zplug "zsh-users/zsh-autosuggestions"
# プロンプトテーマ
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# venvを自動でactivateとdeactivate
zplug "Tarrasch/zsh-autoenv" 
# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# gist
zplug "b4b4r07/gist", from:gh-r, as:command, use:"*darwin*amd64*"
# fzf
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"
# fzf history
zplug "kokeman/af815d5a4f0c7f31d423f4906d85078a", from:gist
# 結果を上に表示
# export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'


#alias
alias ls='ls -G'

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load

# 補完候補をタブで選択。補完候補が２つ以上なければすぐに補完
zstyle ':completion:*:default' menu select=2
# 補完候補に色をつける
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 環境変数
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# pyenv
export  PYENV_ROOT=$HOME/.pyenv
export  PATH=$PYENV_ROOT/bin:$PATH
eval  "$(pyenv init -)"

# Path Go
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH

# CUDA
export  CUDA_PATH=/usr/local/cuda-9.2
export  LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

