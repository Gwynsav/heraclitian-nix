module MyManage
(myManage) where

import XMonad

import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks    (manageDocks)
import XMonad.Hooks.ManageHelpers

myManage = (composeAll . concat $
    [ [ resource  =? "desktop_window" --> doIgnore    ]
    , [ resource  =? "kdesktop"       --> doIgnore    ]
    , [ isDialog                      --> doFloat     ]
    , [ isFullscreen                  --> doFullFloat ]
    , [ insertPosition End Newer                      ]
    , [ manageDocks                                   ]
    ])
