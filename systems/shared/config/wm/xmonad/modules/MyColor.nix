{ colors }:
''
module MyColor
( myColor
) where

import Data.Map as M

colors = 
  [ ("nbg"  , "#${colors.nbg}")
  , ("lbg"  , "#${colors.lbg}")
  , ("blk"  , "#${colors.blk}")
  , ("gry"  , "#${colors.gry}")
  , ("wht"  , "#${colors.wht}")
  , ("dfg"  , "#${colors.dfg}")
  , ("nfg"  , "#${colors.nfg}")

  , ("red"  , "#${colors.red}")
  , ("red_d", "#${colors.red_d}")
  , ("grn"  , "#${colors.grn}")
  , ("grn_d", "#${colors.grn_d}")
  , ("ylw"  , "#${colors.ylw}")
  , ("ylw_d", "#${colors.ylw_d}")
  , ("blu"  , "#${colors.blu}")
  , ("blu_d", "#${colors.blu_d}")
  , ("mag"  , "#${colors.mag}")
  , ("mag_d", "#${colors.mag_d}")
  , ("cya"  , "#${colors.cya}")
  , ("cya_d", "#${colors.cya_d}")
  ]

myColor key = M.findWithDefault "#ff0000" key (fromList colors)
''
