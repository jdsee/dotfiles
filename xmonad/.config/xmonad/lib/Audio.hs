module Audio where

import XMonad

data PulseCmd = ToggleMute | Mute | Unmute | RaiseVol | LowerVol

-- audio :: PulseCmd -> String
audio ToggleMute  = mute "toggle"
audio Mute        = mute "true"
audio Unmute      = mute "false"
audio RaiseVol    = change "+"
audio LowerVol    = change "-"

-- TODO this should be local to audio
mute x = spawn $ "pactl set-sink-mute @DEFAULT_SINK@ " ++ x
change op = spawn $ "pactl set-sink-volume @DEFAULT_SINK@ " ++ op ++ "5%"

