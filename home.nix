{ config, pkgs, ... }:

{
    imports = [
        ./programs
        ./games
        ./development
        ./xdg
        ./dconf.nix
        ./pkgs.nix
    ];
    
    home.username = "john";
    home.homeDirectory = "/home/john";

    programs.home-manager.enable = true;

    systemd.user.startServices = true;
    
    nixpkgs.config = {
        allowUnfree = true;
    };

    home.stateVersion = "23.11";
}
