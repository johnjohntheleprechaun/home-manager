{ config, pkgs, ... }:

{
    xdg.mimeApps.defaultApplications = {
        "image/jpeg" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/png" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/bmp" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/gif" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/tiff" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/webp" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/svg+xml" = [ "org.nomacs.ImageLounge.desktop" ];
        "application/x-xcf" = [ "gimp.desktop" ];
    };
}