{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # GNOME extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.appindicator

        # Graphical applications
        yubikey-manager-qt
        aws-sam-cli
        zoom-us
        gnome.gnome-terminal
        gnome.nautilus
        gnome.gnome-tweaks
        gnome.file-roller
        gnome.gnome-disk-utility
        gedit
        gimp
        discord
        chromium
        vlc
        orca-slicer
        godot_4
        blender
        nomacs
        audacity
        evince

        # CLI packages
        usbutils
        zip
        unzip
        file
        ssh-import-id
        ffmpeg
        dig
        openssl
        binutils
        jq
        trash-cli

        # Other shit
        ntfs3g
        monitor
    ];
    programs.chromium.enable = true;
}
