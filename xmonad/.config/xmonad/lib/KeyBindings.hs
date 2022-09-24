module KeyBindings (
  KeyBindings.modify
) where

import Audio

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

modify :: XConfig a -> XConfig a
modify conf = conf `additionalKeysP`
            [ ("M-C-q", spawn "betterlockscreen -l dimblur"  )
            , ("M-w"  , kill                                                          )
            , ("M-S-s", unGrab *> spawn "flameshot screen -c"                         )

            -- Applications
            , ("M-<Return>",  spawn "alacritty"                 )
            , ("M-S-f",       spawn "firefox-developer-edition" )

            -- Rofi
            , ("M-<Space>",   spawn "rofi -show drun"         )
            , ("M4-<Space>",  spawn "rofi -show windowcd"     )
            , ("S-<Space>", spawn "rofi-rbw"                )
            -- , ("M-S-<Space>", spawn "rofi -show filebrowser"  )

            -- Navigation
            , ("M-C-l",   nextWS                )
            , ("M-C-h",   prevWS                )
            , ("M-S-l",   shiftToNext >> nextWS )
            , ("M-S-h",   shiftToPrev >> prevWS )
            , ("M-<Tab>", toggleWS              )

            -- Media Keys
            , ("<XF86AudioRaiseVolume>",    audio Unmute >> audio RaiseVol  )
            , ("<XF86AudioLowerVolume>",    audio Unmute >> audio LowerVol  )
            , ("<XF86AudioMute>",           audio ToggleMute                )
            , ("<XF86MonBrightnessUp>",     spawn "lux -a 10%"              )
            , ("<C-XF86MonBrightnessUp>",   spawn "lux -a 5%"               )
            , ("<XF86MonBrightnessDown>",   spawn "lux -s 10%"              )
            , ("<C-XF86MonBrightnessDown>", spawn "lux -s 5%"               )
            , ("<XF86Search>",              spawn "rofi -show drun"         ) -- TODO: compose command
            ]

