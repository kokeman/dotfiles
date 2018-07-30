# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source ~/.zplug/init.zsh

# plugins
# 履歴からコマンドを提案してくれる
zplug "zsh-users/zsh-autosuggestions"
# プロンプトテーマ
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# 色付け
zplug "zsh-users/zsh-syntax-highlighting"


# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# 環境変数
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# 補完機能を有効にする
# autoload -Uz compinit && compinit

# 補完候補を一覧表示にする
# setopt auto_list

# 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=2 

# 補完候補の色付け
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cdなしで移動可能にする
# setopt auto_cd

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"


