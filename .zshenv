source ~/.localrc
ulimit -c unlimited

export \
    PATH=~/bin:~/local/bin:/usr/local/bin:$PATH \
    LD_LIBRARY_PATH=$HOME/local/lib \
    CPATH=$HOME/local/include \
    RUBY_LIB=$HOME/local/lib \
    PERL5LIB=$HOME/local/lib/perl5 \
    PERL_MM_OPT=--sudo \
    EDITOR=vim VISUAL=vim \

which ccache 2>&1 > /dev/null && export CC='ccache gcc'

FAV_ENCODING=${FAV_ENCODING:-en_US.utf8}
if locale -a | grep -q $FAV_ENCODING; then
    export LC_ALL=$FAV_ENCODING
else
    echo "Favorite encoding, $FAV_ENCODING, unavailable. =(  Try 'export FAV_ENCODING=...' in your ~/.localrc using one of these:"
    locale -a
fi

if [[ -e ~/.zsh-git-prompt ]]; then
    source ~/.zsh-git-prompt
    PROMPT='$(git_super_status)%# '
    RPROMPT='%B%m%~%b'
else
    echo "https://github.com/olivierverdier/zsh-git-prompt needed."
fi

[ -e /usr/lib/debug ] && export LD_LIBRARY_PATH=!:2:$LD_LIBRARY_PATH
export HISTSIZE=100000 HISTFILE=~/.zsh_history SAVEHIST=100000
alias dwdiff='dwdiff -c' # color
eval $(dircolors)
export ZLS_COLORS=$LS_COLORS
setopt \
    autocd \
    autolist \
    autopushd \
    autoresume \
    cdablevars \
    correct \
    completeinword \
    extendedglob \
    globdots \
    extended_history \
    incappend_history \
    histignorespace \
    histignoredups \
    longlistjobs \
    mailwarning \
    noclobber \
    noignoreeof \
    nolistbeep \
    notify \
    pushdminus \
    pushdsilent \
    pushdtohome \
    rcquotes \
    equals \
    interactivecomments \
    nobadpattern \
    printexitvalue \


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
