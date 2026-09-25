# dell-fan-control.nix
# Module for custom fan control on Dell laptops running NixOS

{ pkgs, ... }:

{
  # 1. Load the Dell kernel module with forced fan control access
  boot.kernelModules = [ "dell-smm-hwmon" ];
  boot.extraModprobeConfig = ''
    options dell-smm-hwmon restricted=0 force=1
  '';

  # 2. Install utility to control Dell SMBIOS fan overrides
  environment.systemPackages = with pkgs; [
    dell-bios-fan-control
  ];

  # 3. Enable CoolerControl background daemon and graphical UI
  programs.coolercontrol.enable = true;

  # 4. Automatically disable Dell BIOS fan override on startup
  systemd.services.disable-dell-bios-fan-control = {
    description = "Disable Dell BIOS Fan Override";
    wantedBy = [ "multi-user.target" ];
    after = [ "sys-devices-platform-dell--smm--hwmon.device" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.dell-bios-fan-control}/bin/dell-bios-fan-control 0";
      RemainAfterExit = true;
    };
  };
}
