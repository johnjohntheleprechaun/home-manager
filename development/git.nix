{
  config,
  pkgs,
  ...
}: {
  programs.gpg = {
    enable = true;
    settings = {
      "pinentry-mode" = "loopback";
    };
  };
  programs.git = {
    enable = true;
    userName = "John Jorgensen";
    userEmail = "john@leprechaun.dev";
    signing = {
      signByDefault = true;
      key = null;
    };
    aliases = {
      hist = "log --graph --stat";
      stat = "status";
      a = "add";
      ap = "add -p";
      bdiff = "diff --stat";
      # commit types
      cap = "!f(){ git add -p && git commit; };f";
      camp = "!f(){ git add -p && git commit -m \"$1\"; };f";
      cam = "commit -am";
      cm = "commit -m";
      ca = "commit --amend";
      caa = "commit -a --amend";
      can = "commit --amend --no-edit";
      caan = "commit -a --amend --no-edit";
    };
    extraConfig = {
      init.defaultBranch = "main";
      merge.ff = false;
      pull.ff = true;
      safe.directory = "/etc/nixos";
    };
  };
}
