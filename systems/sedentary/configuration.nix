# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, ... }:

let 
  impermanence = builtins.fetchTarball {
    url    = 
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
    sha256 = "0hpp8y80q688mvnq8bhvksgjb6drkss5ir4chcyyww34yax77z0l";
  };
in

{
  imports = [
    # Import the impermanence module.
    "${impermanence}/nixos.nix"

    # Import other system configuration files.
    ./hardware-configuration.nix
    ( import ./home { inherit pkgs; } )
  ];

  # Boot Loader
  # -----------
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable     = true;
      version    = 2;
      efiSupport = true;
      device     = "nodev";
    };
  };

  # Users
  # -----
  users = {
    mutableUsers = false;
    users = {
      root = {
        initialPassword = "safefrfr";
      };
      gw = {
        initialPassword = "gwaaaaaa";
        isNormalUser    = true;
        extraGroups     = [ "wheel" ]; # Enable ‘sudo’ for the user.
        packages        = [ ];
      };
    };
  };

  # Filesystem & Persistent Files
  # -----------------------------
  fileSystems."/" = {
    device  = "none";
    fsType  = "tmpfs";
    options = [ "defaults" "size=2G" "mode=755" ];
  };

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
  }; 
  # environment.etc."machine-id".source =
  #   "/nix/persist/etc/machine-id";

  # Networking
  # ----------
  networking = {
    hostName              = "heraclitus"; # Define your hostname.
    networkmanager.enable = true;         # Easiest to use and most distros use this by default.
    # Firewall.
    firewall.enable       = true;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
  };

  # Localization and Time
  # ---------------------
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Packages
  # --------
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
      git
      wget
      vim;
  };

  # Enable the X11 windowing system.
  # services.xserver = {
  #   enable = true;
  #   layout = "us";
  #   xkbOptions = {
  #     "caps:super" # map caps to super.
  #   };
  #   Enable touchpad support.
  #   libinput.enable = true;
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # NixOS Settings
  # --------------
  nix = {
    settings = {
      # Enable flakes.
      experimental-features = [ "nix-command" "flakes" ];
      # Cleanup
      auto-optimise-store   = true;
    };
    gc = {
      automatic = true;
      options   = "--delete-older-than 5d";
    };
    optimise.automatic = true;
  };
  system = {
    # Incompatible with flakes.
    copySystemConfiguration = false;
    # OS release at time of installation.
    stateVersion = "22.11";
  };
}

