{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./nixvim/nixvim.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot loader stuff
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Disks-related stuff
  services.devmon.enable = true;  
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  # Internet and bluetooth stuff
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.supplicant = {
    "wlp60s0" = {
      configFile.path = "/home/yuri/.wifi/wpa_supplicant.conf";
    };
  };
  hardware.bluetooth.enable = true;

  # Sound stuff
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Novosibirsk";

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
    rustup
    rust-analyzer
    # gcc
    # python3
    # texliveFull
    # texlivePackages.babel-russian
    # asymptote
    # git # Configured in ./home-manager

    # Uilities & stuff
    brightnessctl
    # waybar # Configured in ./home-manager
    eww
    swww
    # alacritty # Configured in ./home-manager
    ffmpeg
    pamixer
    ripgrep
    fd
    zram-generator
    hyprpicker

    # Fun & rice
    fastfetch
    zenith
    cbonsai
    cmatrix

    # Desktop apps
    xfce.thunar
    kdePackages.okular
    # firefox # Configured in ./home-manager
    # telegram-desktop # Enabled in ./home-manager
    # discordo
    # libresprite
    # urn-timer
    # obs-studio
    # vlc
    # gimp
    # libsForQt5.kdenlive

    # Gaming (Not needed)
    # gnugo
    # libsForQt5.kigo
    # retroarchFull

    # Custom cursor???
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  # Hyprland stuff
  programs.hyprland.enable = true;
  hardware.graphics.enable = true;

  # Updating packages 
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # User-related stuff
  users.users.yuri = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ]; # Enable ‘sudo’ for the user.
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

  # Useful comment

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
  system = {
    stateVersion = "24.05"; # Did you read the comment?
  };

}

