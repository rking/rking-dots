#!/bin/zsh
PATH=~/bin:$PATH
source ~/.localrc

ssh-add ~/.ssh/id_rsa

#nvidia-settings -a InitialPixmapPlacement=0 -a GlyphCache=1 # XXX Maybe?

mailterm
codeterm
logwatcher

unclutter -idle 1 &

firefox-bin &
devilspie 2>&1 | grep -v 'e_sexp_eval: assertion `f->tree != NULL' | \
    sed 's/.*/devilspie noise: [34m&[0m/' &

ck-launch-session # ConsoleKit stuff (needed for wicd)
xfce4-session

killall devilspie skype unclutter
