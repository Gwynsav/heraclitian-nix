{ config, pkgs, ... }:

{
  home = {
    username      = "gw";
    homeDirectory = "/home/gw";
  };

  imports = [
    # Terminals
    ( import ../../shared/config/term/tym      { inherit pkgs; } )

    # Shells
    ( import ../../shared/config/shell/hilbish { inherit pkgs; } )
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
