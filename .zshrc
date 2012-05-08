# echo before .zshrc: $PATH
umask 022
# ~/.zshenv takes care of ~/.localrc
source ~/.zaliases
source ~/.zshkeys
stty -ixon
[ -e ~/.afterlocalrc ] && source ~/.afterlocalrc
# echo after .zshrc: $PATH
