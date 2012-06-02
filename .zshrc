umask 077
# ~/.zshenv takes care of ~/.localrc
source ~/.zaliases
source ~/.zshkeys
stty -ixon
[ -e ~/.afterlocalrc ] && source ~/.afterlocalrc
