#  Layout notes

max size for ipad keys: 128pt

max size for phone is basically take geometry reader of device width and divide by 4.

height is basically the width, with exception of non-square keys, grid spaces.


Aspect ratio for the display is 2.19-ish. Fills entire area on touch-id phones, leaves room for some branding, skewy for iphone-X+ later phones.

Do not waste time right now on horizontal layout. Do that after shipping v1


font: 
  Routed Gothic, 
  Routed Gothic Narrow, 
  Routed Gothic Wide,
  Jetbrains Mono
  Ticket Mono OT
  ThreeSix 01 Mono Pro
  Magda Clean Mono OT
  Isonorm Monospaced Pro
  GT Maru Mono
  ABC Diatype Plus Variable


LEDGlowView font settings for:
            DSEG7Classic-Regular -> largeFontSize: UIDevice.isTablet ? 64 : 32,
                                    smallFontSize: UIDevice.isTablet ? 24 : 16)

            