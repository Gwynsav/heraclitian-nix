{ colors, fonts }:

''
* { all: unset; }

// Colors
$dbg:   #${colors.dbg};
$nbg:   #${colors.nbg};
$lbg:   #${colors.lbg};
$blk:   #${colors.blk};
$gry:   #${colors.gry};
$wht:   #${colors.wht};
$dfg:   #${colors.dfg};
$nfg:   #${colors.nfg};

$red:   #${colors.red};
$red_d: #${colors.red_d};
$grn:   #${colors.grn};
$grn_d: #${colors.grn_d};
$ylw:   #${colors.ylw};
$ylw_d: #${colors.ylw_d};
$blu:   #${colors.blu};
$blu_d: #${colors.blu_d};
$mag:   #${colors.mag};
$mag_d: #${colors.mag_d};
$cya:   #${colors.cya};
$cya_d: #${colors.cya_d};

// Fonts
$mono:  "${fonts.mono}";
$sans:  "${fonts.sans}";
$serif: "${fonts.serif}";
$icons: "${fonts.icons}";

// Generic Settings
window {
  font-family:      $sans;
  font-size:        1em;
  color:            $nfg;
}

tooltip {
  background-color: $lbg;
  color:            $nfg;
}

// Some numbers
$radius: 6px;

// Imports
@import "./horizontal/bar/bar.scss";
''
