import XMonad

--- Note: This requires xmonad-contrib (on Gentoo, at least)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders

myLayout = ThreeCol 1 (3/100) (1/2) ||| ThreeColMid 1 (3/100) (1/2) ||| Full ||| noBorders (tabbed shrinkText defaultTheme) ||| Accordion

main = xmonad defaultConfig { layoutHook = myLayout }
-- TODO
-- modMask = mod3Mask
