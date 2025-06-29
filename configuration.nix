{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./fonts.nix
      ./nixvim/nixvim.nix
      #./hyprcursor/hyprcursor.nix
      # ./nixvim/plugins/bundle.nix
      #./autohypr.nix
      #./firefoxx.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable session for hyprland on start
  #services.ircClient.enable = config.networking.hostName == "nixos";
  #services.ircClient.user = "yuri"; 

  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.wayland.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    # (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    nerd-fonts.symbols-only
    fira-code-symbols
    cascadia-code
    ipaexfont
  ];

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      ibus.engines = with pkgs.ibus-engines; [ mozc ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1:8085";

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.devmon.enable = true;  
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  users.users.yuri = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ]; # Enable ‘sudo’ for the user.
  };

  services.getty.autologinUser = "yuri";

  programs.hyprland.enable = true;

  hardware.graphics.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Home-manager
    home-manager

    # For programming & stuff
    rustup
    rust-analyzer
    gcc
    python3
    texliveFull
    texlivePackages.babel-russian
    asymptote
    git
    #gnumake

    # Uilities & stuff
    brightnessctl
    waybar
    rofi
    eww
    swww
    alacritty
    ffmpeg
    pamixer
    ripgrep
    fd
    zram-generator

    # Fun & rice
    fastfetch
    zenith
    cbonsai
    cmatrix

    # Desktop apps
    firefox
    xfce.thunar
    telegram-desktop
    discord
    CuboCore.corepdf
    libresprite
    urn-timer
    obs-studio
    vlc
    gimp
    libsForQt5.kdenlive

    # Gaming (Not needed)
    gnugo
    libsForQt5.kigo
    retroarchFull

    # Custom cursor???
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
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

  # imports = [
    # ./opts.nix
    # ./keymaps.nix
    # ./autocmds.nix
    # ./plugins/bundle.nix
  # ];

#   programs.nixvim = {
#     enable = true;
# 
#     defaultEditor = true;
#     colorschemes.tokyonight.enable = true;
# 
#     plugins.nix.enable = true;
# 
#     extraPlugins = with pkgs.vimPlugins; [
#       surround
#       # ale
#     ];
#   };

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
  system.stateVersion = "24.05"; # Did you read the comment?

}

