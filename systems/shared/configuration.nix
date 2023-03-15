# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, inputs, impermanence, ... }:

{
  imports = [
    # Import the impermanence module.
    impermanence.nixosModules.impermanence
  ];

  # Boot Loader
  # -----------
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint     = "/boot";
    };
    grub = {
      enable     = true;
      version    = 2;
      efiSupport = true;
      device     = "nodev";
      extraEntries = ''
        menuentry "UEFI BIOS" --id 'uefi-firmware' {
          fwsetup
        }
        menuentry "Reboot" {
          echo "System rebooting..."
          reboot
        }
        menuentry "Shutdown" {
          echo "System shutting down..."
          halt
        }
      '';
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
        extraGroups     = [ 
          "wheel" "networkmanager" "audio" "video"
          "libvirtd"
        ];
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
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
    files = [
      "/etc/machine-id"
    ];
  }; 

  programs.fuse.userAllowOther = true;

  # Networking
  # ----------
  networking = {
    networkmanager.enable = true;
    # Firewall.
    firewall = {
      enable       = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  # Localization and Time
  # ---------------------
  time = {
    timeZone                 = "Europe/Amsterdam";
    hardwareClockInLocalTime = true;
  };
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font         = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Security
  # --------
  security = {
    sudo.enable = false;
    doas = {
      enable     = true;
      extraRules = [
        {
          groups  = [ "wheel" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

  # Fonts
  # -----
  fonts = {
    fonts = lib.attrValues {
      inherit (pkgs.unstable)
        ibm-plex
        material-icons
        noto-fonts-emoji-blob-bin;
    } ++ [( pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; } )];
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "IBM Plex Sans" ];
        serif     = [ "IBM Plex Serif" ];
        monospace = [ "IBM Plex Mono" "FiraCode Nerd Font" ];
        emoji     = [ "Blobmoji" ];
      };
    };
  };

  # Packages
  # --------
  environment.systemPackages = lib.attrValues {
    inherit (pkgs.stable)
      shotgun hacksaw xclip
      libnotify pulseaudio virt-manager
      gnumake cmake gcc lua
      git wget unzip exa asciidoctor ffmpeg vim;
  } ++ [( lib.hiPrio pkgs.stable.procps )];

  # X Server
  # --------
  # services.xserver = {
  #   enable     = true;
  #   layout     = "us";
  #   xkbOptions = "caps:super";
  #   libinput = {
  #     enable             = true;
  #     mouse.accelProfile = false;
  #   };
  #   displayManager = {
  #     sddm.enable    = true;
  #     defaultSession = "none+awesome";
  #   };
  #   windowManager.awesome = {
  #     enable     = true;
  #     luaModules = lib.attrValues {
  #       inherit (pkgs.luaPackages) lgi ldbus luadbi-mysql luaposix;
  #     };
  #   };
  # };

  # Qt / GTK
  # --------
  qt5 = {
    enable        = true;
    platformTheme = "gtk2";
    style         = "gtk2";
  };

  # Sound
  # -----
  services.pipewire = {
    enable       = true;
    jack.enable  = true;
    pulse.enable = true;
    alsa = {
      enable       = true;
      support32Bit = true;
    };
  };
  systemd.user.services = {
    pipewire.wantedBy       = [ "default.target" ];
    pipewire-pulse.wantedBy = [ "default.target" ];
  };

  # Hardware
  # --------
  services.printing.enable = true;
  hardware.bluetooth = {
    enable      = true;
    powerOnBoot = false;
  };

  # Virtualization
  # --------------
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable          = true;

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
