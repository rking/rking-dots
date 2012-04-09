#!/bin/sh
PATH=~/bin:$PATH
ssh-add ~/.ssh/id_rsa

#nvidia-settings -a InitialPixmapPlacement=0 -a GlyphCache=1 # XXX Maybe?

mailterm
codeterm
logsterm

unclutter -idle 1 &

firefox-bin &
devilspie 2>&1 | grep -v 'e_sexp_eval: assertion `f->tree != NULL' | \
    sed 's/.*/devilspie noise: [34m&[0m/' &

xfdesktop &
xfwm4 --daemon
xfce4-panel

killall devilspie skype unclutter
