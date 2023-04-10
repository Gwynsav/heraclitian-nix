# This file exists for the sole purpose of being able to pass fonts
# from fontconfig into program configurations more cleanly.

{ config }:

{
  sans  = (builtins.head config.fonts.fontconfig.defaultFonts.sansSerif);
  mono  = (builtins.head config.fonts.fontconfig.defaultFonts.monospace);
  serif = (builtins.head config.fonts.fontconfig.defaultFonts.serif);
  icons = "Material Icons";
}
