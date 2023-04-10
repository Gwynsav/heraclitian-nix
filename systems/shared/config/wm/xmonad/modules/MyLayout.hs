module MyLayout
( myLayout
) where

import XMonad

import XMonad.Hooks.ManageDocks            (avoidStruts)
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile         (ResizableTall(..))
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableThreeColumns (ResizableThreeCol(..))
import XMonad.Layout.ToggleLayouts         (toggleLayouts)

import MyColor

myLayout = 
    toggleLayouts (noBorders Full) 
    $ avoidStruts $ maximize $ tbar bConf $ wGaps (tiled ||| columns)
  where
    -- master and stack definition (number of masters, resize step (0..1), master ratio)
    tiled   = ResizableTall 1 0.02 0.58 []
    columns = ResizableThreeColMid 1 0.02 0.58 []
    -- layout gaps (outer, inner)
    wGaps   = spacingRaw False (Border 8 8 8 8) True (Border 4 4 4 4) True
    -- top decoration configuration
    tbar    = simpleDeco shrinkText
    bConf   = 
      def { activeColor         = myColor "gry"
          , activeBorderColor   = myColor "gry"
          , activeTextColor     = myColor "gry"
          , inactiveColor       = myColor "blk"
          , inactiveBorderColor = myColor "blk"
          , inactiveTextColor   = myColor "blk"
          , urgentColor         = myColor "red_d"
          , urgentBorderColor   = myColor "red_d"
          , urgentTextColor     = myColor "red_d"
          -- size settings
          , decoHeight          = 16
          , decoWidth           = 320
          }

