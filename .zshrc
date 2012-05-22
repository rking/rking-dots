# echo before .zshrc: $PATH
umask 022
# ~/.zshenv takes care of ~/.localrc
source ~/.zaliases
source ~/.zshkeys
stty -ixon
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
[ -e ~/.afterlocalrc ] && source ~/.afterlocalrc
# echo after .zshrc: $PATH
