{ config, pkgs, ... }:

{
    imports = [
        ./web.nix
        ./images.nix
    ];
    xdg.mimeApps.enable = true;
    xdg.mimeApps.defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
}