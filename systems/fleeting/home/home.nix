{ config, pkgs, lib, colors, fonts, ... }:

{
  imports = [
    # WM
    # ( import ../../shared/config/wm/openbox        { inherit pkgs colors fonts; } )
    ( import ../../shared/config/wm/awesome        { } )
    
    # Terminals
    ( import ../../shared/config/term/tym          { inherit pkgs colors fonts; } )

    # Shells
    ( import ../../shared/config/shell/hilbish     { inherit pkgs; } )

    # Editors
    ( import ../../shared/config/editor/emacs      { inherit pkgs fonts; } )

    # Browsers
    ( import ../../shared/config/browser/firefox   { inherit colors fonts; } )
    ( import ../../shared/config/browser/librewolf { } )
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
