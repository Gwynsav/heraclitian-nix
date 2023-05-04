{ colors, fonts, ... }:

{
  programs.discocss = {
    enable       = true;
    discordAlias = true;
    css          = import ./newCSS.nix { inherit colors fonts; };
    /* css          = import ./customCSS.nix { inherit config colors fonts; }; */
  };
}
