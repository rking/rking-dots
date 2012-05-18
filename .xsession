#!/bin/zsh
PATH=~/bin:$PATH
source ~/.localrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

ck-launch-session # ConsoleKit stuff (needed for wicd)

# GTK+ doesn't respect .XCompose unless you do this:
export GTK_IM_MODULE=xim
xmodmap .Xmodmap

#nvidia-settings -a InitialPixmapPlacement=0 -a GlyphCache=1 # XXX Maybe?

sshellterm
codeterm
logwatcher

# For auditory fanciness:
(while sleep 0.1; do xsetb -r || exit 1; done) &

unclutter -idle 1 &

firefox-bin -P default &
# firefox-bin -no-remote -P SMS &
skype &

(sleep 16;
    devilspie 2>&1 | grep -v 'e_sexp_eval: assertion `f->tree != NULL' |
    sed 's/.*/devilspie noise: [34m&[0m/') &

(sleep 3; rkwmctrl 1) &

sleep 3 # Not sure about this. =\
xfce4-session

killall devilspie skype unclutter
