//
//  DigitalSevenFont.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

enum DigitalSevenFont: String, CaseIterable {
  case classicBold                = "DSEG7Classic-Bold"
  case classicBoldItalic          = "DSEG7Classic-BoldItalic"
  case classicItalic              = "DSEG7Classic-Italic"
  case classicLight               = "DSEG7Classic-Light"
  case classicLightItalic         = "DSEG7Classic-LightItalic"
  case classicRegular             = "DSEG7Classic-Regular"
  
  case classicMiniBold            = "DSEG7ClassicMini-Bold"
  case classicMiniBoldItalic      = "DSEG7ClassicMini-BoldItalic"
  case classicMiniItalic          = "DSEG7ClassicMini-Italic"
  case classicMiniLight           = "DSEG7ClassicMini-Light"
  case classicMiniLightItalic     = "DSEG7ClassicMini-LightItalic"
  case classicMiniRegular         = "DSEG7ClassicMini-Regular"
  
  case classic14Bold              = "DSEG14Classic-Bold"
  case classic14BoldItalic        = "DSEG14Classic-BoldItalic"
  case classic14Italic            = "DSEG14Classic-Italic"
  case classic14Light             = "DSEG14Classic-Light"
  case classic14LightItalic       = "DSEG14Classic-LightItalic"
  case classic14Regular           = "DSEG14Classic-Regular"
  
  case classic14MiniBold          = "DSEG14ClassicMini-Bold"
  case classic14MiniBoldItalic    = "DSEG14ClassicMini-BoldItalic"
  case classic14MiniItalic        = "DSEG14ClassicMini-Italic"
  case classic14MiniLight         = "DSEG14ClassicMini-Light"
  case classic14MiniLightItalic   = "DSEG14ClassicMini-LightItalic"
  case classic14MiniRegular       = "DSEG14ClassicMini-Regular"
  
  func font(size: CGFloat) -> Font {
    return .custom(self.rawValue, size: size)
  }
}
