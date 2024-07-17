{ config, pkgs, ... }:

let
    draculaRepo = pkgs.fetchgit {
        url = "https://github.com/dracula/kitty.git";
        rev = "87717a3f00e3dff0fc10c93f5ff535ea4092de70";
        sha256 = "0iv6i08fimkbjg79sygy4kqlh136fkxaqcg2qmp4psh4vhgx7hzg";
    };
    draculaConfig = builtins.readFile "${draculaRepo}/dracula.conf" + "\n" + builtins.readFile "${draculaRepo}/diff.conf";
in
{
    programs.kitty = {
        enable = true;
        settings = {
            cursor_shape = "block";
            cursor_shape_unfocused = "hollow";
            shell_integration = "no-cursor";
            mouse_hide_wait = "-1";
        };
        extraConfig = draculaConfig;
    };
}
