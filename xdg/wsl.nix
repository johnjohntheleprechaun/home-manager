{ config, pkgs, ... }:

{
    programs.bash.initExtra = ''
        export PATH="$HOME/.local/bin:$PATH"
    '';
    home.file.".local/bin/xdg-open" = {
        source = ./wsl.sh;
        executable = true;
    };
    home.packages = [ pkgs.wslu ];
}
