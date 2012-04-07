[ "$TERM" = screen.linux ] && export TERM=screen
(screen -list | grep -C100 'Multi, .*tached') || exec screen
screen -r
