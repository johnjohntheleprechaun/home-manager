{ config, pkgs, ...}:

{
    programs.bash = {
        enable = true;
        bashrcExtra = ''
            # Cross compiling support for aws cdk
            docker run --rm --privileged multiarch/qemu-user-static --reset -p yes > /dev/null
            
            # Set PS1 to show git status
            source ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
            export PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\[\e[96m\]\$(__git_ps1 ' (%s)') \[\e[32m\]\$\[\033[0m\] "
        '';
    };
}
