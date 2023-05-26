{ config, pkgs, lib, colors, fonts, impermanence, ... }:

{
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
      ".local/nvim/lspservers"
      ".local/nvim/parsers"

      # Browser extension configuration
      ".mozilla/firefox/gw"

      # Playlists and music state
      ".local/share/mpd"
      ".local/share/ncmpcpp"

      # Recording settings and setup
      ".config/obs-studio/basic/profiles"

      # AwesomeWM
      ".config/awesome"

      # Persist Steam login, settings and installed games
      # and compatibility tools. Steam doesn't like symlinks.
      ".local/share/Steam"
      # And also Heroic GL stuff (which also complains
      # about symlinks).
      ".config/heroic"
      ".config/legendary"
      "Downloads/games"

      # Persist Discord login and settings
      {
        directory = ".config/discord";
        method    = "symlink";
      }
    ];
    files = [
      # Basic stuff
      ".screenrc"
      ".gitconfig"
    ];
    allowOther = true;
  };

  # Home Manager
  # ------------
  programs.home-manager.enable = true;
  home = {
    # Home Manager release at time of installation.
    stateVersion = "22.11";

    # User setup.
    username      = "gw";
    homeDirectory = "/home/gw";
    packages = lib.attrValues {
      inherit (pkgs)
        # tools
        pcmanfm font-manager galculator
        # editing/recording
        gimp inkscape obs-studio
        # viewing and modifying
        tageditor gpick nsxiv
        # screenshooting
        maim xclip
        # notifications/audio libs
        libnotify pulseaudio; 
    };

    # Files and Variables.
    file = {
      ".local/bin/run" = {
         text       = import ./bin/run.nix {};
         executable = true;
      };
      ".local/bin/blast" = {
         text       = import ./bin/blast.nix {};
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

  xdg.enable = true;
}
