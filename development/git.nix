{
  config,
  pkgs,
  ...
}: let
  vars = import ../local/vars.nix;
in {
  programs.gpg = {
    enable = true;
    settings = {};
  };
  programs.git = {
    enable = true;
    userName = "John Jorgensen";
    userEmail = "john@leprechaun.dev";
    signing = {
      signByDefault = true;
      key = vars.sshKeyPath;
    };
    aliases = {
      hist = "log --graph --stat";
      stat = "status";
      a = "add";
      ap = "add -p";
      bdiff = "diff --stat";
      inspect = "!f(){ git diff \"$1\"^!; }; f";
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
      pull.ff = "only";
      safe.directory = "/etc/nixos";
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
  };
}
