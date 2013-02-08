#!/bin/zsh
PATH=~/bin:$PATH

ck-launch-session # ConsoleKit stuff (needed for wicd)

# GTK+ doesn't respect .XCompose unless you do this:
export GTK_IM_MODULE=xim

,keys
irc73rm1n4l
firefox-bin &
thunderbird-bin &
73rm1n4l -name t1 -e ,t 1 &
(sleep 10; skype) &

# For auditory fanciness:
(while sleep 0.1; do xsetb -r || exit 1; done) &

unclutter -idle 1 &

subtle

killall skype
