{ config, pkgs, ... }:

{
    imports = [
        ./web.nix
    ];
    xdg.mimeApps.enable = true;
}