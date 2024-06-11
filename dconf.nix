{ config, pkgs, ... }:

{
    dconf.settings = {
        "org/gnome/desktop/app-folders".folder-children = [
            "games"
        ];
        "org/gnome/desktop/app-folders/folders/games" = {
            name = "Games";
            apps = [  ];
        };
        # "org/gnome/shell".app-picker-layout
        "org/gnome/shell".favorite-apps = [
            "firefox.desktop"
            "org.gnome.Terminal.desktop"
            "org.gnome.Nautilus.desktop"
            "spotify.desktop"
            "code.desktop"
            "discord.desktop"
        ];
        "org/gnome/shell/extensions/dash-to-dock" = {
            running-indicator-style = "DOTS";
        };
        "org/gnome/shell".enabled-extensions = [
            "appindicatorsupport@rgcjonas.gmail.com"
            "dash-to-dock@micxgx.gmail.com"
        ];
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
            natural-scroll = false;
            two-finger-scrolling-enabled = true;
        };
        "org/gnome/mutter".edge-tiling = true;
    };
}