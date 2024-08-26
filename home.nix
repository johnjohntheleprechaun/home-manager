{ config, pkgs, ... }:

let
    # check if this is in WSL2
    isWSL = builtins.getEnv "WSL_DISTRO_NAME" != null;
in
{
    imports = [
        ./programs
        ./games
        ./development
        ./xdg
        ./dconf.nix
        ./pkgs.nix
    ];
    
    custom.xdg.wslSupport = true;
    custom.dconf.enable = !isWSL;
    home.username = "john";
    home.homeDirectory = "/home/john";

    programs.home-manager.enable = true;
    
    nixpkgs.config = {
        allowUnfree = true;
    };

    home.stateVersion = "23.11";
}
