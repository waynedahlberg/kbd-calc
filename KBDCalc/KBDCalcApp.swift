//
//  KBDCalcApp.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

@main
struct KBDCalcApp: App {
  var body: some Scene {
    WindowGroup {
//      HexagonGridView(rows: 8, columns: 80, hexagonSize: 4, strokeColor: .blue)
       SquareKeysTestView()
    }
  }
}
