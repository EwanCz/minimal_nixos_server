{
  pkgs,
  ...
}:
{
  home-manager.users.zethec = {
    home = {
      username = "zethec";
      homeDirectory = "/home/zethec";
      stateVersion = "26.05";
      packages = with pkgs; [
        btop
        ncdu
        eza
      ];
    };

    programs = {
      git = {
        enable = true;
        settings = {
          user.name = "ewan";
          user.email = "ewan.czarny@gmail.com";
          core.editor = "nvim";
          protocol.file.allow = "always";
        };
      };
    };

  };
}
