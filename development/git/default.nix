{
  config,
  pkgs,
  ...
}: let
  vars = import ../../local/vars.nix;
in {
  home.file.".ssh/allowed_signers" = {
    enable = true;
    source = ./allowed_signers;
  };
  programs.git = {
    enable = true;
    settings = {
      user.name = "John Jorgensen";
      user.email = "john@leprechaun.dev";
      alias = {
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

      init.defaultBranch = "main";
      merge.ff = false;
      pull.ff = "only";
      safe.directory = "/etc/nixos";
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
    signing = {
      signByDefault = true;
      key = "~/.ssh/main_key";
    };
  };
}
