{ config, pkgs, ... }:

let
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
    };
in
{
    programs.firefox = {
        enable = true;
        profiles.john = {
            extensions = with nur.repos.rycee.firefox-addons; [
                bitwarden
            ];
        };
    };
}