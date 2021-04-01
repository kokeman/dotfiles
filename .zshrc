
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# pure themeをロード
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=10000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 重複を記録しない
setopt append_history # 既存のファイルに追記していく
setopt share_history # 複数のzshで履歴を共有
setopt hist_ignore_all_dups # 過去に実行したコマンドは記録しない

# lsの色設定(mac)
LSCOLORS=exfxcxdxbxegedabagacad # mac
alias ls='ls -G'
# lsの色設定(linux)
# zstyle ':completion:*' list-colors di=34 ln=35 ex=31
# alias ls='--color'

zinit light zsh-users/zsh-autosuggestions # 文字入力時に直近の履歴をサジェスト
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23' # Solarized dark用
zinit light zdharma/fast-syntax-highlighting # コマンド・引数に色をつける

# fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
# fzf を ^rで使えるように（履歴から検索できるように）
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
export FZF_DEFAULT_OPTS='--height 40% --reverse --border' # 上から表示するように

# 補完機能を有効にする
autoload -U compinit
compinit
# 補完候補をタブで選択。補完候補が２つ以上なければすぐに補完
zstyle ':completion:*:default' menu select=2
# 補完候補に色をつける
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
