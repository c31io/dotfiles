{ config, lib, pkgs, ... }:
{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      intelBusId = "pci@0000:00:02.0";
      nvidiaBusId = "pci@0000:01:00.0";
    };
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    modesetting.enable = true;
    nvidiaSettings = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
}
