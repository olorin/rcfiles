import           System.IO
import           XMonad
import           XMonad.Config.Desktop
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Util.EZConfig       (additionalKeys)
import           XMonad.Util.Run            (spawnPipe)

manage' = composeAll
  [ manageDocks
  , composeOne [ isFullscreen -?> doFullFloat ]
  , manageHook . ewmh $ defaultConfig
  ]

main :: IO ()
main = xmonad =<< xmobar defaultConfig
  { focusFollowsMouse = True
  , terminal = "urxvtc"
  , modMask = mod4Mask
  , manageHook = manage'
  , layoutHook = avoidStruts . layoutHook . ewmh $ defaultConfig
  }
