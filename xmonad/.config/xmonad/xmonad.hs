
import XMonad

import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

main :: IO ()
main  = xmonad
      . ewmhFullscreen
      . ewmh
      . docks
      . myStatusBar
      $ myConfig

myConfig = def 
    { terminal = "alacritty"
    , borderWidth = 1
    , focusedBorderColor = "#d5c4a1"
    , normalBorderColor = "#504945"
    , layoutHook = avoidStruts $ mySpacing $ layoutHook def
    -- , manageHook = manageHook def <+> manageDocks
    }
    `additionalKeysP` keymap

-- Startup Actions
startupHook :: X ()
startupHook = return () -- TODO: start alacritty on ws 2

-- Status Bar
myStatusBar = withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure myStatusBarPP)) defToggleStrutsKey

myStatusBarPP :: PP
myStatusBarPP = def { ppCurrent = xmobarColor "white" "black"
                    , ppTitle = xmobarColor "87af87" "" . shorten 120
                    }

-- Spacing
mySpacing = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True

-- TODO: add type annotation
keymap =  [ ("M-C-q",                       spawn "betterlockscreen -l"           )
          , ("M-w"  ,                       kill                                  )
          , ("M-C-s",                       unGrab *> spawn "flameshot screen -c" )

          -- Applications
          , ("M-<Return>",                  spawn "alacritty"                     )
          , ("M-S-f",                       spawn "firefox-developer-edition"     )

          -- Rofi
          , ("M-<Space>",                   spawn "rofi -show drun"               )
          , ("M4-<Space>",                  spawn "rofi -show windowcd"           )
          , ("M-S-<Space>",                 spawn "rofi -show filebrowser"        )

          -- Navigation
          , ("M-C-l",                         nextWS                              )
          , ("M-C-h",                         prevWS                              )
          , ("M-S-l",                         shiftToNext >> nextWS               )
          , ("M-S-h",                         shiftToPrev >> prevWS               )
          , ("M-<Tab>",                     toggleWS                              )

          -- Media Keys
          , ("<XF86AudioRaiseVolume>",      spawn $ audio Raise                   )
          , ("<XF86AudioLowerVolume>",      spawn $ audio Lower                   )
          , ("<XF86AudioMute>",             spawn $ audio Toggle                  )
          , ("<XF86MonBrightnessUp>",       spawn "lux -a 10%"                    )
          , ("<XF86MonBrightnessDown>",     spawn "lux -s 10%"                    )
          , ("<XF86Search>",                spawn "rofi -show drun"               ) -- TODO: compose command
          ]

data PulseCmd = Toggle | Mute | Unmute | Raise | Lower

audio :: PulseCmd -> String
audio Toggle  = mute "toggle"
audio Mute    = mute "true"
audio Unmute  = mute "false"
audio Raise   = audio Unmute ++ change "+"
audio Lower   = audio Unmute ++ change "-"

-- TODO this should be local to pulse
mute x = "pactl set-sink-mute @DEFAULT_SINK@ " ++ x ++ " ; "
change op = "pactl set-sink-volume @DEFAULT_SINK@  -" ++ op ++ "5%"

