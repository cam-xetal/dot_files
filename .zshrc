autoload -U compinit
compinit
# 環境変数LANG
export LANG=ja_JP.UTF-8
typeset -U PATH CDPATH FPATH MANPATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin
export MANPATH=/usr/local/man:/usr/texbin/man:$MANPATH
# プロンプトの設定(カレントディレクトリを右に)
PROMPT="%% "
RPROMPT="[%/]"
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
#
autoload colors
colors
case ${UID} in
0)
  PROMPT="%{${fg[blue]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[blue]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac
## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac
# キーバインドをVimライクに
bindkey -v
# 履歴検索機能のショートカット
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# ディレクトリ名でcd
setopt auto_cd
# 移動したディレクトリを記録
setopt auto_pushd
# タブで移動したディレクトリ一覧
setopt auto_pushd
# コマンド入力ミス補正
setopt correct
# 補完候補をつめて表示
setopt list_packed
# 履歴をファイルに保存する
HISTFILE=$HOME/.zsh_hisotry
# メモリ内の履歴の数
HISTSIZE=100000
# 保存される履歴の数
SAVEHIST=100000
#重複をなくす
setopt hist_ignore_dups
# 履歴ファイルに時刻を記録
setopt extended_history
# 全履歴の一覧を出力する
function history-all { history -E 1 }
#先方予想
autoload predict-on
predict-on
#alias
alias ls="ls -la"
alias -g L="| less"
alias -g G="| grep"

#コマンドライン空でEnter入力の場合lsを実行
alls() {
  zle accept-line
  if [[ -z "$BUFFER" ]]; then
    echo ''
    ls
  fi
}
zle -N alls
bindkey "\C-m" alls
