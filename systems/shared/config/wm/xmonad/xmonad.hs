-- Imports
----------
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks  (docks)
import XMonad.Util.EZConfig      (removeKeysP, additionalKeysP)
import XMonad.Util.SpawnOnce

-- Configuration modules
import MyColor
import MyBinds
import MyLayout
import MyManage

-- Configuration
----------------
main :: IO ()
main = xmonad $ ewmhFullscreen $ docks $ ewmh $ def
    -- Basics
    { modMask            = mod4Mask
    , terminal           = myTerm
    , workspaces         = map show [1 .. 7 :: Int]

    -- Bling
    , borderWidth        = 2
    , normalBorderColor  = myColor "blk"
    , focusedBorderColor = myColor "gry"

    -- Hooks
    , layoutHook         = myLayout
    , handleEventHook    = handleEventHook def
    , manageHook         = myManage
    , startupHook        = myStartupHook
    }
    `removeKeysP`     myUnbinds
    `additionalKeysP` myRebinds

-- Startup
----------
myStartupHook = do
  -- For some reason XMonad.Util.Cursor sets the cursor to the default 
  -- Adwaita one. For that reason I won't be using it.
  spawnOnce "xsetroot -cursor_name left_ptr &"
  spawnOnce wallpaper
  spawnOnce "eww open bar &"
      where
          wallpaper = "hsetroot -cover " ++ myWall ++ " &"
