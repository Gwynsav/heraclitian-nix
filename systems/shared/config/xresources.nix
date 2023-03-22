{ colors, fonts }:

{
  xresources = {
    extraConfig = ''
      !!! Monochrome
      *background : #${colors.nbg}
      *color0     : #${colors.lbg}
      *color8     : #${colors.blk}
      *color7     : #${colors.gry}
      *color15    : #${colors.dfg}
      *foreground : #${colors.nfg}
      !!! Colors
      *color1     : #${colors.red_d}
      *color9     : #${colors.red}
      *color2     : #${colors.grn_d}
      *color10    : #${colors.grn}
      *color3     : #${colors.ylw_d}
      *color11    : #${colors.ylw}
      *color4     : #${colors.blu_d}
      *color12    : #${colors.blu}
      *color5     : #${colors.mag_d}
      *color13    : #${colors.mag}
      *color6     : #${colors.cya_d}
      *color14    : #${colors.cya}
      !!! Font
      *faceName   : ${fonts.mono}:antialias=true
      *faceSize   : 11
    '';
  };
}
