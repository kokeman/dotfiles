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

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
