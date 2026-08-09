{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.myConfig;
in
{
  options.myConfig.boot = mkOption {
    type = types.nullOr (
      types.enum [
        "LEGACY"
        "UEFI"
      ]
    );
    default = null;
    description = "Set grub based on BIOS";
  };

  config = mkMerge [
    {
      assertions = [
        {
          assertion = cfg.boot != null;
          message = "Invalid grub config";
        }
      ];
    }

    (mkIf (cfg.boot == "LEGACY") {
      boot.loader = {
        systemd-boot.enable = false;
        grub = {
          enable = true;
          efiSupport = false;
          useOSProber = false;
        };
      };
    })

    (mkIf (cfg.boot == "UEFI") {
      boot.loader = {
        systemd-boot.enable = false;
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
        };
      };
    })
  ];
}
