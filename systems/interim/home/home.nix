{ config, pkgs, lib, colors, fonts, ... }:

{
  home.packages = lib.attrValues {
    inherit (pkgs.stable)
      openrgb piper;
    inherit (pkgs.unstable)
      protonup-ng heroic steam;
  };
  
  imports = [
    # Terminals
    ( import ../../shared/config/term/tym        { inherit pkgs colors fonts; } )

    # Shells
    ( import ../../shared/config/shell/hilbish   { inherit pkgs; } )

    # Editors
    ( import ../../shared/config/editor/emacs    { inherit pkgs fonts; } )

    # Browsers
    ( import ../../shared/config/browser/firefox { inherit colors fonts; } )
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
