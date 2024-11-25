{ config, pkgs, ... }:

let
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
    };
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
    programs.firefox = {
        enable = true;
        package = unstable.firefox;
        profiles.john = {
            extensions = with nur.repos.rycee.firefox-addons; [
                bitwarden
            ];
        };
    };
}
