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


# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

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

# CUDA
export  CUDA_PATH=/usr/local/cuda-9.2
export  LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH
