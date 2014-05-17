import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myFullScreenHook = composeOne [
        isFullscreen -?> doFullFloat
	]

myManageHook = composeAll [
        --     isFullscreen -?> doFullFloat,
             manageDocks
          ] <+> myFullScreenHook 


main = xmonad =<< xmobar defaultConfig
	{ 
	  focusFollowsMouse = True,
	  terminal = "urxvt", 
          modMask = mod4Mask,
          manageHook = myManageHook <+> manageHook defaultConfig,
          layoutHook = avoidStruts $ layoutHook defaultConfig

	}



	
