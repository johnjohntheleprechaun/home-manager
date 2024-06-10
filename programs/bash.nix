{ config, pkgs, ...}:

{
    programs.bash = {
        enable = true;
        bashrcExtra = ''
            # Cross compiling support for aws cdk
            docker run --rm --privileged multiarch/qemu-user-static --reset -p yes > /dev/null
            echo test
        '';
    };
}