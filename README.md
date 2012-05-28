See: http://github.com/ingydotnet/rkingy-dots for a more complete use.

The Idea
--------

So I can sit down at an unconfigured machine, and run:

    [[ !-d ~/src ]] && mkdir ~/src \
        cd $_ && git clone git@github.com:ryanjosephking/config.git && \
        make -C config

...then it will provide me with a decently synced config. Specifically, it's
all symlink-driven: on a given machine, I edit `~/.zaliases` and it's really
editing `~/.zaliases`.  This means that when I then do a `cd ~/src/config; git
commit ...; git push`, it will be available to all other machines as soon as I
`git pull` from their `~/src/config/`. Most of the time I won't even have to do
a new `make` (unless I've added additional files).

At the moment, some of this is a bit crufty, but I plan on refining it
soonish. If I remember to remove this comment then it proves that I was
serious about this intention.

Intertwinencies
---------------

This stuff pretty much assumes the presence (and use) of:
    - zsh
    - vim
    - screen

Note that the X stuff comes along for the ride, but simply sits there and does
nothing on the machines it is irrelevant to.

Per-host Config
---------------

All machine-specific stuff can be driven by two scripts:
- `~/.localrc` (sourced by `.zshenv`) - Good for setting variables that will
  then "talk" to the subsequent `.zshenv`, `.zaliases`, and `.zshkeys`
- `~/.afterlocalrc` (sourced by `.zshrc`) - Good for overriding anything that
  would otherwise get clobbered by being set in `~/.localrc` alone.

.screenrc
---------

One kind of weird part is the generation of the `~/.screenrc`'s. This is
essentially so that I can set $SCREENESC and $SCREENCOLOR on a per-machine
basis (in `~/.localrc`). This is because when I'm on my desktop using ^a with
green, then connected to a DMZ machine using ^x with red, and finally a dev
machine with ^j and blue -- they are all quickly identified and manipulated.

A simple `~/.localrc` for this would be:

    export COLOR=33 SCREENCOLOR=y SCREENESC=j

This makes the `$PS1` color (terminal "33") the same as the screen status color.

It's been a while since I looked at this, so perhaps there is a way to make it
work without the `~/.screenrc` generation.

Next Step
---------

It needs some kind of personal overlay system - so I can separate the stuff I
think is of general use from the things that are clearly specific to my own
projects.

A more complete solution would be more based on sets of configs. So, people
who use bash could get all the common stuff with people who use zsh, etc. I
haven't had this problem, yet, so I'm leaving it non-generalized. If you want
to be the second test case, I'd be happy to cook something up.

Thanks
------

...to COL Ingus for the original conception of the system.
