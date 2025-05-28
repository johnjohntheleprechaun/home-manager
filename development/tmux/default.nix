{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 10;
    baseIndex = 1;
    mouse = false;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = builtins.readFile ./extra.conf;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = dracula;
        extraConfig = builtins.readFile ./dracula.conf;
      }
    ];
  };
}
