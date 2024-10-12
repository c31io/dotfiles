{ config, lib, pkgs, ... }:
{
  #boot.initrd.kernelModules = [ "nvidia" ];
  #boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:0:2";
      nvidiaBusId = "PCI:0:1:0";
    };
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    modesetting.enable = true;
    nvidiaSettings = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
