{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./bashrc-extra.sh;
    shellAliases = {
      "rm" = "trash";
    };
  };
  home.packages = with pkgs; [
    trash-cli
  ];
  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };
}
