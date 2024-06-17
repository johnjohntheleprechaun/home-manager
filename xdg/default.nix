{ config, pkgs, ... }:

{
    imports = [
        ./web.nix
        ./images.nix
    ];
    xdg.mimeApps.enable = true;
}