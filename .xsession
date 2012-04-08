#!/bin/sh
PATH=~/bin:$PATH
ssh-add ~/.ssh/id_dsa

mailterm
codeterm
logwatcher

nvidia-settings -a InitialPixmapPlacement=0 -a GlyphCache=1 # XXX Maybe?

hotkeys -t msdigimedia &
bbkeys &
unclutter -idle 1 &
xmodmap -e 'keycode 113 = Multi_key'
#uim-xim --engine=pinyin-big5 &

skype &
nice -n 19 firefox &
xchat &
devilspie -a &

xfdesktop &
xfwm4 --daemon
xfce4-panel

killall devilspie skype unclutter xchat uim-xim bbkeys hotkeys
#echo -n > .xsession-errors
