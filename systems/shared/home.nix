{ config, pkgs, lib, colors, impermanence, ... }:

{
  # User Setup
  # ----------
  home = {
    username      = "gw";
    homeDirectory = "/home/gw";
  };

  # Config Files
  # ------------
  imports = [ 
    # Impermanence import
    impermanence.nixosModules.home-manager.impermanence 
    
    # Miscelaneous
    ( import ./config/browser/firefox { } )
    ( import ./config/browser/discord { } )
    ( import ./config/utils/picom     { inherit colors; } )
  ];
  xdg.configFile.awesome.source = ./config/awesome;

  # Impermanence
  # ------------
  home.persistence."/nix/persist/home/gw" = {
    directories = [ 

      # XDG User directories
      "Desktop" "Downloads" "Music" "Pictures"

      # User program data and keyrings
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/hilbish"
      {
        directory = ".local/share/Steam";
        method    = "symlink";
      }

    ];
    files = [
      ".screenrc"
      ".gitconfig"
    ];
    allowOther = true;
  };

  # Home Manager
  # ------------
  programs.home-manager.enable = true;
  home = {
    file = {
      ".local/bin/fetch" = {
         text       = import ./bin/fetch.nix {};
         executable = true;
      };
      ".local/bin/panes" = {
         text       = import ./bin/panes.nix {};
         executable = true;
      };
      ".icons/default".source =
        "${pkgs.phinger-cursors}/share/icons/phinger-cursors";
    };
    sessionVariables.XDG_DATA_HOME = 
      "${config.home-manager.users.gw.home.homeDirectory}/.local/share";
    sessionPath  = [ 
      "${config.home-manager.users.gw.home.homeDirectory}/.local/bin" 
    ];

    stateVersion = "22.11";
  };
}
