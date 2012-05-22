# echo before $0: $PATH
type keychain 2>&1 > /dev/null &&
    keychain -q ~/.ssh/*id_?sa &&
    . ~/.keychain/$HOST-sh &&
    . ~/.keychain/$HOST-sh-gpg
# echo after $0: $PATH
