{ config, pkgs, lib, colors, ... }:

{
  imports = [
    # Terminals
    ( import ../../shared/config/term/tym      { inherit pkgs colors; } )

    # Shells
    ( import ../../shared/config/shell/hilbish { inherit pkgs; } )

    # Editors
    ( import ../../shared/config/editor/emacs  { inherit pkgs; } )
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
