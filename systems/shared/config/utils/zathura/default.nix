{ colors, fonts }:

{
  programs.zathura = {
    enable  = true;
    options = {
      font                      = "${fonts.serif}";
      statusbar-h-padding       = "16";
      statusbar-v-padding       = "24";

      default-bg                = "#${colors.nbg}";
      default-fg                = "#${colors.nfg}";

      statusbar-bg              = "#${colors.nbg}";
      statusbar-fg              = "#${colors.nfg}";

      inputbar-bg               = "#${colors.nbg}";
      inputbar-fg               = "#${colors.nfg}";

      notification-bg           = "#${colors.lbg}";
      notification-fg           = "#${colors.nfg}";
      notification-error-bg     = "#${colors.nbg}";
      notification-error-fg     = "#${colors.red}";
      notification-warning-bg   = "#${colors.lbg}";
      notification-warning-fg   = "#${colors.ylw}";

      highlight-color           = "#${colors.blk}";
      highlight-active-color    = "#${colors.blu}";

      completion-bg             = "#${colors.lbg}";
      completion-fg             = "#${colors.nfg}";
      completion-highlight-bg   = "#${colors.lbg}";
      completion-highlight-fg   = "#${colors.nfg}";

      index-bg                  = "#${colors.nbg}";
      index-fg                  = "#${colors.nfg}";
      index-active-bg           = "#${colors.blk}";
      index-active-fg           = "#${colors.ylw}";

      recolor-lightcolor        = "#${colors.nbg}";
      recolor-darkcolor         = "#${colors.nfg}";
      recolor                   = true;
      recolor-keephue           = false;

      selection-clipboard       = "clipboard";
    };
  };
}
