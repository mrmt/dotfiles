#!/bin/zsh
# $Id: .zshrc,v 1.3 2002/07/08 00:57:16 morimoto Exp $
# for Mac OS X

path=(~/bin /usr/X11R6/bin /usr/local/sbin /usr/local/bin $path)

unset SSH_AUTH_SOCK

# zsh$B$G$O(B $[ $B!D(B ] $B$G3g$C$?ItJ,$O?t<0$H$7$F7W;;$7$F$/$l$k(B
# $B%W%m%s%W%HJ8;zNsCf$N%(%9%1!<%W%7!<%1%s%9$r3g$k$?$a$N5-K!(B %{ $B!D(B }
PROMPT="%m-%n-[%i]: "

# man zsh $B$7$F$b%*%W%7%g%sJQ?t$,$$$C$Q$$$"$C$F!"$I$l$,JXMx$J$N$+(B
# $B$h!<$o$+$i$s$H$$$&$A$_$N$?$a$K!"!V$3$l$@$1$D$1$H$-$c$8$&$V$s$8$c$m!W(B
# $B%*%W%7%g%s0lMw!#(B
setopt auto_cd auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys no_hup

# setopt no_beep
unsetopt correct
setopt auto_list auto_menu

# $B%3%^%s%I%i%$%s$N@hF,$K%9%Z!<%9$r$$$l$F$*$/$H%R%9%H%j$KDI2C$7$J$$(B
setopt hist_ignore_space

compctl -o setopt unsetopt
compctl -b bindkey

# emacs key bindings
bindkey -e

# < file $B$N$H$-$N%Z!<%8%c(B
READNULLCMD=lv

bindkey 'ESC-B' emacs-backward-word

# Alt+B $B$H$+(B Alt+F $B$G%o!<%I%8%c%s%W$9$k$H$-$N8l6-3&$NDj5A(B
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
# $B3HD%@55,I=8=$r;H$($k$h$&$K$9$k(B
setopt extendedglob

# $B%3%^%s%IL>$rJd40$7$F$/$l(B
compctl -c sudo 
compctl -l '' sudo 

# $BJQ?tL>$rJd40$7$F$/$l(B
compctl -v export unset set vared typeset

# zsh $B$N%*%W%7%g%s$rJd40$7$F$/$l(B
compctl -o setopt unsetopt

# zsh $B$N%P%$%s%G%#%s%0$rJd40$7$F$/$l(B
compctl -b bindkey

# kill
# $B%W%m%;%9HV9f$H$+%7%0%J%kL>$rJd40(B
z_signals=(`kill -l`)
function z_get_process {
  reply=(`ps ax | awk '{print $1}' 2>/dev/null`)
}
compctl -x 's[-]' -k z_signals -- + -K z_get_process kill

# ssh, ping
# $B%[%9%HL>$rJd40(B
function z_ssh_host {
  reply=(`awk '{print $1}' ~/.ssh/known_hosts* 2>/dev/null | sed 's/,/ /'`)
}
compctl -K z_ssh_host ssh
compctl -K z_ssh_host ssh-copy-id
compctl -K z_ssh_host ssh-copy
compctl -K z_ssh_host ping

# make
# Makefile $B$rFI$s$G%?!<%2%C%H$rJd40(B
function z_make_target {
  reply=(`test -r Makefile && grep '^[a-zA-Z][a-zA-Z-]*:' Makefile | sed 's/:.*//'`)
}
compctl -K z_make_target make

autoload -U compinit

# emacs $B$G(B M-x shell $B$G5/F0$7$?$H$-$O(B $BM>7W$J$3$H$7$J$$$h$&$K(B
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
