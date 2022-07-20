module Keymap (
  Keymap.modify
) where

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

data PulseCmd = ToggleMute | Mute | Unmute | RaiseVol | LowerVol

-- audio :: PulseCmd -> String
audio ToggleMute  = mute "ToggleMute"
audio Mute        = mute "true"
audio Unmute      = mute "false"
audio RaiseVol    = change "+"
audio LowerVol    = change "-"

-- TODO this should be local to audio
mute x = spawn $ "pactl set-sink-mute @DEFAULT_SINK@ " ++ x
change op = spawn $ "pactl set-sink-volume @DEFAULT_SINK@ " ++ op ++ "5%"

modify :: XConfig a -> XConfig a
modify conf = conf `additionalKeysP`
            [ ("M-C-q", spawn "betterlockscreen -l dimblur"  )
            , ("M-w"  , kill                                    )
            , ("M-S-s", unGrab *> spawn "flameshot screen -c"   )

            -- Applications
            , ("M-<Return>",                  spawn "alacritty"                     )
            , ("M-S-f",                       spawn "firefox-developer-edition"     )

            -- Rofi
            , ("M-<Space>",                   spawn "rofi -show drun"               )
            , ("M4-<Space>",                  spawn "rofi -show windowcd"           )
            , ("M-S-<Space>",                 spawn "rofi -show filebrowser"        )

            -- Navigation
            , ("M-C-l",                       nextWS                                )
            , ("M-C-h",                       prevWS                                )
            , ("M-S-l",                       shiftToNext >> nextWS                 )
            , ("M-S-h",                       shiftToPrev >> prevWS                 )
            , ("M-<Tab>",                     toggleWS                              )

            -- Media Keys
            , ("<XF86AudioRaiseVolume>",      audio Unmute >> audio RaiseVol        )
            , ("<XF86AudioLowerVolume>",      audio Unmute >> audio LowerVol        )
            , ("<XF86AudioMute>",             audio ToggleMute                      )
            , ("<XF86MonBrightnessUp>",       spawn "lux -a 10%"                    )
            , ("<XF86MonBrightnessDown>",     spawn "lux -s 10%"                    )
            , ("<XF86Search>",                spawn "rofi -show drun"               ) -- TODO: compose command
            ]

