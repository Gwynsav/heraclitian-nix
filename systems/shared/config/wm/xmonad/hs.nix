{ colors }:

''
-- Imports
----------
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile (ResizableTall(..), MirrorResize(..))
import XMonad.Layout.Spacing
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Util.Cursor          (setDefaultCursor)
import XMonad.Util.EZConfig
import XMonad.Util.Run             (safeSpawn, unsafeSpawn)
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab

-- Configuration
----------------
main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ def
    -- Basics
    { modMask    = mod4Mask
    , terminal   = myTerm
    , workspaces = map show [1 .. 7 :: Int]

    -- Bling
    , borderWidth = 2

    -- Colors
    , normalBorderColor  = "#${colors.blk}" 
    , focusedBorderColor = "#${colors.grn}"

    -- Hooks
    , layoutHook      = myLayout
    , handleEventHook = handleEventHook def
    }

    -- Unbind
    `removeKeysP`
    [ ("M-S-<Return>") -- Used to open terminal
    , ("M-<Return>")   -- Used to swap with master
    , ("M-S-c")        -- Used to kill clients
    , ("M-q")          -- Used to reload Xmonad
    , ("M-S-q")        -- Used to quit Xmonad
    ]
    -- Rebind
    `additionalKeysP`
    [ ("M-<Return>" , spawn myTerm)                                       -- Opens a terminal
    , ("M-q"        , kill)                                               -- Kills a client
    , ("M-f"        , sendMessage (Toggle "Full"))                        -- Fullscreens window
    , ("M-C-r"      , unsafeSpawn "xmonad --recompile; xmonad --restart") -- Reloads Xmonad
    ]

-- Variables
------------
myTerm     = "tym"
myLauncher = "rofi -show drun"

-- Layouts
----------
myLayout = toggleLayouts (noBorders Full) (wgaps $ tiled ||| Mirror tiled)
  where
    tiled = ResizableTall 1 0.02 0.58 []
    wgaps = spacingRaw False (Border 8 8 8 8) True (Border 4 4 4 4) True

-- Rules
--------

-- Startup
----------
myStartupHook = do
  setDefaultCursor xC_left_ptr
''
