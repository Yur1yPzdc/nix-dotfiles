{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware_configuration.nix
      ./nixvim/nixvim.nix
      ./modules/networking.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" "pipe-operators" ];

  # Boot loader stuff
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      splashImage = ./bg/grub-bg.png;
    };
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    timeout = null;
  };

  # Latest kernel
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "i915" "nvidia" "nvidia_drm" ];
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # # Other nvidia driver stuff

  # # Disable X11 entirely
  # services.xserver.enable = false;
  services.seatd.enable = true;

  # Enable NVIDIA proprietary driver
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;  # Required for Wayland
    package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
    nvidiaSettings = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;  # gives `nvidia-offload`
      };
      intelBusId = "PCI:0:2:0";   # Intel iGPU
      nvidiaBusId = "PCI:1:0:0";  # NVIDIA dGPU
    };
  };

  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
    WLR_RENDERER_ALLOW_SOFTWARE = "0";
  };

  # # Blacklist nouveau
  # boot.kernelParams = [ "modprobe.blacklist=nouveau" ];
  # boot.extraModprobeConfig = "blacklist nouveau";

  # Enable general graphics support (needed for Vulkan, etc.)
  # hardware.graphics = {
  #   enable = true;
  # };

  # Disks-related stuff
  services.devmon.enable = true;  
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  # Power-management stuff
  powerManagement.enable = true;

  # Sound stuff
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Text input stuff
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      ibus.engines = with pkgs.ibus-engines; [ mozc ];
    };
    defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  };

  # Packages stuff
  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    powerline-fonts
    powerline-symbols
    nerd-fonts.caskaydia-cove
    # Japanese cool fonts
    ipaexfont
    ricty
  ];
  environment.systemPackages = with pkgs; [
    # Home-manager
    home-manager

    # For programming & stuff
    # rustup                 # Should be used in nix-shell
    # rust-analyzer          # Should be used in nix-shell
    # gcc                    # Should be used in nix-shell
    # python3
    # texliveFull            # Should be used in nix-shell
    # texliveMedium
    # texlivePackages.babel-russian
    # asymptote
    # git                    # Configured in ./home-manager

    # Uilities & stuff
    brightnessctl
    # waybar                 # Configured in ./home-manager and flake.nix
    awww
    # alacritty              # Configured in ./home-manager
    ffmpeg
    pamixer
    ripgrep
    fd
    zram-generator
    hyprpicker
    hyprshot

    # Fun & rice
    fastfetch
    zenith
    cbonsai
    cmatrix

    # Desktop apps
    thunar
    kdePackages.okular
    # firefox                # Configured in ./home-manager
    # telegram-desktop       # Enabled in ./home-manager

    # Custom cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Hyprland stuff
  # programs.hyprland.enable = true;

  # Updating packages 
  system.autoUpgrade = {
    enable = false;
    flake = "path:/home/yuri/nixos-config";
    flags = [
      "--recreate-lock-file"
      "--commit-lock-file"
    ];
    dates = "14:00";
  };

  # Garbage collection
  nix.gc = {
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # User-related stuff
  users.users.yuri = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "render" "input" "seat" "video" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$y$j9T$M.dAcUpes1Rh7tVraEQca/$IFu7LTUzd70aYT1/4YQZNB2tPRYhprSjj4EeoEk21B4";
  };
  services.getty.autologinUser = "yuri";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Zram config
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 100;
    priority = 999;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}


