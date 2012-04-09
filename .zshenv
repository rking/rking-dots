source ~/.localrc
ulimit -c unlimited

export \
    PATH=~/bin:~/local/bin:/usr/local/bin:~/.rvm/bin:$PATH \
    LD_LIBRARY_PATH=$HOME/local/lib \
    CPATH=$HOME/local/include \
    RUBY_LIB=$HOME/local/lib \
    GEM_HOME=$HOME/local/gems \
    EDITOR=vim VISUAL=vim \

which ccache 2>&1 > /dev/null && export CC='ccache gcc'

FAV_ENCODING=${FAV_ENCODING:-en_US.utf8}
if locale -a | grep -q $FAV_ENCODING; then
    export LC_ALL=$FAV_ENCODING
else
    echo "Favorite encoding, $FAV_ENCODING, unavailable. =(  Try 'export FAV_ENCODING=...' in your ~/.localrc using one of these:"
    locale -a
fi

[ -e /usr/lib/debug ] && export LD_LIBRARY_PATH=/usr/lib/debug:$LD_LIBRARY_PATH
export PROMPT="%{[${COLOR}m%}%m%{[0m%}%# " RPROMPT='%~'
export HISTSIZE=100000 HISTFILE=~/.zsh_history SAVEHIST=100000
eval $(dircolors)
export ZLS_COLORS=$LS_COLORS
setopt \
    autocd \
    autolist \
    autopushd \
    autoresume \
    cdablevars \
    correct \
    extendedglob \
    globdots \
    histignoredups \
    longlistjobs \
    mailwarning \
    noclobber \
    noignoreeof \
    notify \
    pushdminus \
    pushdsilent \
    pushdtohome \
    rcquotes \
    appendhistory \
    completeinword \
    equals \
    histignorespace \
    interactivecomments \
    nobadpattern \
    printexitvalue \
