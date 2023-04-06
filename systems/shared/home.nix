{ config, pkgs, lib, colors, fonts, impermanence, ... }:

{
  # User Setup
  # ----------
  home = {
    username      = "gw";
    homeDirectory = "/home/gw";
    packages = lib.attrValues {
      inherit (pkgs.stable)
        # editing/recording
        gimp inkscape obs-studio
        # viewing and modifying
        tageditor gpick nsxiv
        # screenshooting
        shotgun hacksaw xclip
        # notifications/audio libs
        libnotify pulseaudio; 
    };
  };

  # Config Files
  # ------------
  imports = [ 
    # Impermanence import
    impermanence.nixosModules.home-manager.impermanence 

    # Music
    ( import ./config/music/yt-dlp    { inherit pkgs config; } )
    ( import ./config/music/mpd       { inherit pkgs config; } )
    ( import ./config/music/ncmpcpp   { inherit pkgs config; } )

    # TUI
    ( import ./config/tui/htop        { inherit config; } )
    ( import ./config/tui/lf          { } )
    
    # Utils
    ( import ./config/utils/picom     { inherit colors; } )
    ( import ./config/utils/zathura   { inherit colors fonts; } )
    
    # Miscelaneous
    ( import ./config/browser/discord { inherit config colors fonts; } )
    ( import ./config/xresources.nix  { inherit colors fonts; } )
  ];

  # Impermanence
  # ------------
  home.persistence."/nix/persist/home/gw" = {
    directories = [ 
      # XDG User directories. Makes declaring `xdg.userDirs.*`
      # pretty pointless.
      "Desktop" "Documents" "Music" "Pictures" "Videos"
      # Only persist downloaded files explicitly wanted
      # for preservation
      "Downloads/archived" 

      # User program data and keyrings
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/hilbish"

      # Playlists and music state
      ".local/share/mpd"
      ".local/share/ncmpcpp"

      # Recording settings and setup
      ".config/obs-studio/basic/profiles"

      # Persist Steam login, settings and installed games
      # and compatibility tools. Steam doesn't like symlinks.
      ".local/share/Steam"

      # Persist Discord login and settings
      {
        directory = ".config/discord";
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
    # Home Manager release at time of installation.
    stateVersion = "22.11";
  };
}
