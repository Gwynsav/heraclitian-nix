module MyBinds
( myUnbinds
, myRebinds
, myTerm
) where

import XMonad

import XMonad.Actions.DwmPromote
import XMonad.Layout.Maximize
import XMonad.Layout.ResizableTile (MirrorResize(..))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ToggleLayouts (ToggleLayout(..))
import XMonad.Util.Run             (safeSpawn, unsafeSpawn)
import XMonad.Util.Ungrab

myTerm     = "tym"
myTop      = myTerm ++ " -e htop"
myTUIFiles = myTerm ++ " -e lf"
myGUIFiles = "nemo"
myLauncher = "rofi -show drun"

-- Bindings
-----------
myUnbinds = 
    [ ("M-S-<Return>") -- Used to open terminal
    , ("M-p")          -- Used to open dmenu
    , ("M-S-p")        -- I forgot what this did
    , ("M-S-c")        -- Used to kill clients
    , ("M-<Return>")   -- Used to swap with master
    , ("M-<Tab>")      -- Used to switch focus to next client
    , ("M-q")          -- Used to reload Xmonad
    , ("M-S-q")        -- Used to quit Xmonad
    ]

myRebinds = 
    [ -- Utilities
      ("M-<Return>"  , unsafeSpawn myTerm)                                 -- Opens a terminal
    , ("M-<Esc>"     , unsafeSpawn myTop)                                  -- Open top
    , ("M-e"         , unsafeSpawn myTUIFiles)                             -- Open TUI file manager
    , ("M-S-e"       , unsafeSpawn myGUIFiles)                             -- Open GUI file manager
    , ("M-p"         , unsafeSpawn myLauncher)                             -- Open launcher
    -- Window
    , ("M-q"         , kill)                                               -- Kills a client
    , ("M-f"         , sendMessage $ Toggle "Full")                        -- Fullscreens window
    , ("M-m"         , withFocused (sendMessage . maximizeRestore))        -- Maximizes window
    , ("M-S-h"       , sendMessage MirrorShrink)                           -- Shrink tiled window
    , ("M-S-l"       , sendMessage MirrorExpand)                           -- Expand tiled window
    , ("M-<Tab>"     , dwmpromote)                                         -- Swap with master
    -- Miscelaneous
    , ("<Print>"     , unGrab *> unsafeSpawn "~/.local/bin/blast sel")     -- Selection screenshot
    , ("M-<Print>"   , unsafeSpawn "~/.local/bin/blast scr")               -- Fullscreen screenshot
    , ("M-S-<Print>" , unsafeSpawn "~/.local/bin/blast del")               -- Delayed (3s) screenshot
    -- EWW
    , ("M-b"         , unsafeSpawn "~/.config/eww/bin/widget bar")         -- Toggles bar visibility
    , ("M-d"         , unsafeSpawn "~/.config/eww/bin/widget dashboard")   -- Toggles bar visibility
    -- XMonad
    , ("M-C-r"       , unsafeSpawn "xmonad --recompile; xmonad --restart") -- Reloads Xmonad
    ]
