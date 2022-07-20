import Keymap as Keys (modify)

import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Spacing
import XMonad.Util.Ungrab

import Graphics.X11.ExtraTypes.XF86

main :: IO ()
main  = xmonad
      . ewmhFullscreen
      . ewmh
      . docks
      . myStatusBar
      $ Keys.modify
      $ myConfig

myConfig = def 
    { terminal = "alacritty"
    , borderWidth = 1
    , focusedBorderColor = "#d5c4a1"
    , normalBorderColor = "#504945"
    , layoutHook = avoidStruts $ mySpacing $ layoutHook def
    -- , manageHook = manageHook def <+> manageDocks
    }

-- Startup Actions
startupHook :: X ()
startupHook = return () -- TODO: start alacritty on ws 2

-- Status Bar
myStatusBar = withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure myStatusBarPP)) defToggleStrutsKey

myStatusBarPP :: PP
myStatusBarPP = def { ppCurrent = xmobarColor "cyan" ""
                    , ppTitle = xmobarColor "87af87" "" . shorten 120
                    }

-- Spacing
mySpacing = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True

