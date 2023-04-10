{ config, colors }:

let 
  inherit (config.home-manager.users.gw.lib.formats.rasi) mkLiteral;
in 

{
  # Variables.
  "*" = {
    bg                = mkLiteral "#${colors.nbg}";
    button            = mkLiteral "#${colors.lbg}";
    dimmed            = mkLiteral "#${colors.wht}";
    fg                = mkLiteral "#${colors.nfg}";
    background-color  = mkLiteral "@bg";
    text-color        = mkLiteral "@fg";
  };

  # Main Window Configuration.
  "#window" = {
    transparency      = "real";
    border            = mkLiteral "0px";
    width             = mkLiteral "28%";
  };
  "#mainbox"  = {
    children          = map mkLiteral [ "inputbar" "listview" ];
  };

  # Inputbar Configuration.
  "#inputbar" = {
    children          = map mkLiteral [ "prompt" "entry" ];
    expand            = false;
  };
  "#prompt"   = {
    enabled           = false;
  };
  "#entry"    = {
    placeholder       = "Search";
    placeholder-color = mkLiteral "@dimmed";
    background-color  = mkLiteral "@button";
    expand            = true;
    padding           = mkLiteral "2.5% 2% 2.5% 2%";
  };

  # Program List Configuration.
  "#listview" = {
    columns           = 2;
    lines             = 6;
    cycle             = true;
    dynamic           = true;
    layout            = mkLiteral "vertical";
    padding           = mkLiteral "2.5% 1.5% 2.5% 1.5%";
  };
  "#element"  = {
    orientation       = mkLiteral "vertical";
    padding           = mkLiteral "1.5% 0% 1.5% 0%";
  };
  "#element-text" = {
    expand            = true;
    vertical-align    = mkLiteral "0.5";
    margin            = mkLiteral "0.8% 1% 0.8% 1%";
    background-color  = mkLiteral "inherit";
    text-color        = mkLiteral "inherit";
  };
  "#element selected" = {
    background-color  = mkLiteral "@button";
  };
}
