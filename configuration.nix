{
  modulesPath,
  pkgs,
  ...
}:
{
  myConfig = {
    boot = "LEGACY";
  };

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./modules/disk-config.nix
    ./modules/boot.nix
    ./modules/home-manager.nix
  ];

  networking.hostName = "1supportable";
  networking.networkmanager.enable = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "zethec"
      ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--deletre-older-than 30d";
    };
  };

  users.users = {
    zethec = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkManager"
        "docker"
      ];
      hashedPassword = "$6$Te4.6urSkyKwoSP2$bb5rNS8Kh3sVayZ6yZy/QXw6YVe75jS6aIA055/5.Oez93K8FJSbFMLkt/JYyMYnhxMS660I1TsQiiVXIwA451";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOYN6rzvK/U6BIix5iwJuWi7+oaOXApGsdPlOv3aNrry pipo.pipo@example.com"
      ];
    };
    snorky = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ];
      hashedPassword = "$6$DTvxWYdOOsmFvPRX$6btQY.WB.kroXGVX56KogfkNipzIzU8XlBo5pI83SVCm8vmarT06fXAQvGWYSFByWsRYIkDZP3AiWpX9vNcD81";
      openssh.authorizedKeys.keys = [
        "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBK/TIbRsivMS3FQNvFoDJPTuH1HCoysXIJVyZ/0OxxwGG+1OdHyFM0OIOxu8dhI7bpDalRY4tQ0HoUwBC8B5gbkAAAAEc3NoOg== 1congrue-15-04-2023-physical_16395325"
      ];
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
  ];

  system.stateVersion = "24.05";
}
