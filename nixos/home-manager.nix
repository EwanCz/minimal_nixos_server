{
  ...
}:
{
  home-manager.users.zethec = {
    home = {
      username = "zethec";
      homeDirectory = "/home/zethec";
      stateVersion = "26.05";

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

      ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
          "github.com" = {
            Hostname = "github.com";
            User = "git";
            IdentityFile = "~/.ssh/tyrosse_repo_key";
            IdentitiesOnly = "yes";
          };
        };

      };
    };

  };
}
