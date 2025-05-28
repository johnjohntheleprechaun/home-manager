# nix-shell stuff
export NIX_SHELL_PRESERVE_PROMPT=1
# Set PS1 to show git status
source ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
TEMPLATE_PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\[\e[96m\]\$(__git_ps1 ' (%s)') \[\e[32m\]\$\[\033[0m\] "

if [[ -n "$IN_NIX_SHELL" ]]; then
    export PS1="(nix-shell)$TEMPLATE_PS1"
else
    export PS1="$TEMPLATE_PS1"
fi

# fix the browser crap from the python webbrowser lib
export BROWSER="wslview %s"

alias ls="ls --color"
