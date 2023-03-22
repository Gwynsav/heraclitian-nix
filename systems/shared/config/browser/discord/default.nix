{ config, colors, fonts }:

{
  programs.discocss = {
    enable       = true;
    discordAlias = true;
    css          = import ./customCSS.nix { inherit config colors fonts; };
  };
}
