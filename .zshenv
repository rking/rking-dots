source ~/.localrc
ulimit -c unlimited

export \
    PATH=~/bin:~/local/bin:/usr/local/bin:~/.rvm/bin:$PATH \
    CC='ccache gcc' \
    LD_LIBRARY_PATH=$HOME/local/lib \
    CPATH=$HOME/local/include \
    RUBY_LIB=$HOME/local/lib \
    GEM_HOME=$HOME/local/gems \
    SECOND_LANG=german \
    SECOND_LANG=greek \
    NLW_TEST_FASTER=1 \
    SOCIALTEXT_DEFAULT_HOST=talc \
    EDITOR=vim VISUAL=vim \

[ -e /usr/lib/debug ] && export LD_LIBRARY_PATH=/usr/lib/debug:$LD_LIBRARY_PATH
export PROMPT="%{[${COLOR}m%}%m%{[0m%}%# " RPROMPT='%~'
export HISTSIZE=100000 HISTFILE=~/.zsh_history SAVEHIST=100000
eval $(dircolors)
eval `dircolors -b`
export ZLS_COLORS=$LS_COLORS
setopt \
    autocd \
    autolist \
    autopushd \
    autoresume \
    cdablevars \
    correct \
    correctall \
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
