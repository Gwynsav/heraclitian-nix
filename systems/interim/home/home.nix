{ config, pkgs, lib, colors, fonts, ... }:

{
  home.packages = lib.attrValues {
    inherit (pkgs.stable)
      openrgb piper;
    inherit (pkgs.unstable)
      protonup-ng heroic;
  };
  
  imports = [
    # WM
    # ( import ../../shared/config/wm/awesome        { } )
    # ( import ../../shared/config/wm/openbox        { inherit pkgs lib; } )
    ( import ../../shared/config/wm/xmonad         { inherit pkgs lib colors; } )
    
    # Terminals
    ( import ../../shared/config/term/tym          { inherit pkgs colors fonts; } )

    # Shells
    ( import ../../shared/config/shell/hilbish     { inherit pkgs config; } )

    # Editors
    # ( import ../../shared/config/editor/emacs      { inherit pkgs fonts; } )
    ( import ../../shared/config/editor/neovim     { inherit pkgs; } )

    # Browsers
    ( import ../../shared/config/browser/firefox   { inherit colors fonts; } )
    ( import ../../shared/config/browser/librewolf { } )

    # Utilities
    ( import ../../shared/config/utils/rofi        { inherit config colors fonts; } )
    ( import ../../shared/config/utils/eww         { inherit pkgs colors fonts; } )
  ];

  gtk = {
    enable     = true;
    # theme.name = "";
    iconTheme = {
      name    = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
  };
}
