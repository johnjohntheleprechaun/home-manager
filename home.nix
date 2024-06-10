{ config, pkgs, ... }:

{
    imports = [
        ./programs
        ./games
        ./development
        ./dconf.nix
        ./pkgs.nix
    ];
    
    home.username = "john";
    home.homeDirectory = "/home/john";

    programs.home-manager.enable = true;
    
    nixpkgs.config = {
        allowUnfree = true;
    };

    home.stateVersion = "23.11";
}
