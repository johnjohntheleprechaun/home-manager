{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # GNOME extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.appindicator

        # Graphical applications
        gnome.gnome-terminal
        gnome.nautilus
        gnome.gnome-tweaks
        gnome.file-roller
        gnome.gnome-disk-utility
        gedit
        gimp
        discord
        spotify
        chromium
        vlc
        orca-slicer
        godot_4
        pavucontrol
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

        # Development packages
        nodejs_20
        nodePackages.aws-cdk
        nodePackages.http-server
        awscli2
        python3
        jdk17
        sshfs

        # Other shit
        ntfs3g
        monitor
    ];
    programs.chromium.enable = true;
}
