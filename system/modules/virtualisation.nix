{ pkgs, lib, ... }: 

{
  virtualisation = {
    open-vm-tools.enable = true;
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        # OVMF is not available on ARM64 systems
        ovmf.enable = false;
      };
    };

    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    qemu
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    # Windows-specific packages not available on ARM
    # win-spice
    # win-virtio  
  ];
}
