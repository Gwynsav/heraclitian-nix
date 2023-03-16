{ config, pkgs, impermanence, ... }:

{
  imports = [ 
    impermanence.nixosModules.home-manager.impermanence
  ];

  # Impermanence
  # ------------
  home.persistence."/nix/persist/home/gw" = {
    directories = [ 
      "Desktop" "Downloads" "Music" "Pictures"
      ".local/share/keyrings" ".local/share/direnv"
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
    username      = "gw";
    homeDirectory = "/home/gw";
    stateVersion = "22.11";

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
  };
}
