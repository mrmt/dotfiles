#!/bin/zsh
# $Id: .zshrc,v 1.3 2002/07/08 00:57:16 morimoto Exp $
# for Mac OS X

path=(~/bin /usr/X11R6/bin /usr/local/sbin /usr/local/bin $path)

unset SSH_AUTH_SOCK

# zshでは $[ … ] で括った部分は数式として計算してくれる
# プロンプト文字列中のエスケープシーケンスを括るための記法 %{ … }
PROMPT="%m-%n-[%i]: "

# man zsh してもオプション変数がいっぱいあって、どれが便利なのか
# よーわからんというちみのために、「これだけつけときゃじうぶんじゃろ」
# オプション一覧。
setopt auto_cd auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys no_hup

# setopt no_beep
unsetopt correct
setopt auto_list auto_menu

# コマンドラインの先頭にスペースをいれておくとヒストリに追加しない
setopt hist_ignore_space

compctl -o setopt unsetopt
compctl -b bindkey

# emacs key bindings
bindkey -e

# < file のときのページャ
READNULLCMD=lv

bindkey 'ESC-B' emacs-backward-word

# Alt+B とか Alt+F でワードジャンプするときの語境界の定義
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
WORDCHARS='_-'

alias ls='ls -CFv'
alias lv='lv -Ou8'

export MANPATH="/usr/local/man:"`manpath`
export MANPAGER=lv
export LANG=ja_JP.utf-8
export EDITOR='open -t -W -n'
export EMAIL=morimoto@mrmt.net
export RUBYLIB=~/Library/Ruby

# http://tehanu.hpcl.titech.ac.jp/zsh/
# 拡張正規表現を使えるようにする
setopt extendedglob

# コマンド名を補完してくれ
compctl -c sudo 
compctl -l '' sudo 

# 変数名を補完してくれ
compctl -v export unset set vared typeset

# zsh のオプションを補完してくれ
compctl -o setopt unsetopt

# zsh のバインディングを補完してくれ
compctl -b bindkey

# kill
# プロセス番号とかシグナル名を補完
z_signals=(`kill -l`)
function z_get_process {
  reply=(`ps ax | awk '{print $1}' 2>/dev/null`)
}
compctl -x 's[-]' -k z_signals -- + -K z_get_process kill

# ssh, ping
# ホスト名を補完
function z_ssh_host {
  reply=(`awk '{print $1}' ~/.ssh/known_hosts* 2>/dev/null | sed 's/,/ /'`)
}
compctl -K z_ssh_host ssh
compctl -K z_ssh_host ssh-copy-id
compctl -K z_ssh_host ssh-copy
compctl -K z_ssh_host ping

# make
# Makefile を読んでターゲットを補完
function z_make_target {
  reply=(`test -r Makefile && grep '^[a-zA-Z][a-zA-Z-]*:' Makefile | sed 's/:.*//'`)
}
compctl -K z_make_target make

autoload -U compinit

# emacs で M-x shell で起動したときは 余計なことしないように
[[ $EMACS = t ]] && unsetopt zle

# Start ssh-agent if it is not already running and set up ssh-agent variables
if [ "x" = "x`ps -x -u ${USER} | egrep '[s]sh-agent'`" ] ; then 
  # no ssh-agent running"
  ssh-agent | sed -e "/^echo/d" > ${HOME}/.ssh/agent-env
fi
source ${HOME}/.ssh/agent-env

export PERL_BADLANG=
export PERL_LOCAL_LIB_ROOT="$HOME/perl5:$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base "$HOME/perl5""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB"
export PATH="$HOME/perl5/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH="$HOME/go"
