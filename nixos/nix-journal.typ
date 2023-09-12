#set text(font: "IBM Plex Sans")
#let url(l) = text(fill: purple)[#l]

= NVIDIA Drivers

To install open-source nvidia drivers, add the following lines to `configuration.nix` file:

```nix
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

```

See #url[https://nixos.wiki/wiki/Nvidia] for more information.

= Auto-mounting a partition

You need to first enable `ntfs` support by adding the following lines:
```nixss
  # Enable NTFS Support
  boot.supportedFilesystems = [ "ntfs" ];
```

To auto-mount a partition, add to the following lines to `hardware-configuration.nix`:
```nix
  fileSystems."{$mount_location$}" =
    { device = "/dev/{$device}";
      fsType = "{$fstype}";
    };
```

For example,
```nix
  fileSystems."/run/media/munir/munir hdd" =
    { device = "/dev/sda2";
      fsType = "ntfs";
    };
```