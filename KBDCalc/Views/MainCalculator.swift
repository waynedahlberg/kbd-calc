//
//  MainCalculator.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI
import MathParser

struct MainCalculator: View {
  @State var lightMode: Bool = true
  @State var currentComputation: String = ""
  @State var mainResult: String = "0"
  
  var body: some View {
    ZStack {
      Color(.primaryBG)
        .ignoresSafeArea()
      
      VStack {
        SunMoonView(lightMode: lightMode)
          .onTapGesture {
            withAnimation {
              lightMode.toggle()
            }
          }
        
        Spacer()
        
//        ComputationView(currentComputation: currentComputation, mainResult: mainResult)
//          .padding(.horizontal, UIDevice.isTablet ? UIScreen.main.bounds.width * 0.15 : 0)
        
        Spacer()
        
        CalculatorButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
        
        if UIDevice.isTablet {
          Spacer()
        }
      }
      .padding()
    }
    .environment(\.colorScheme, lightMode ? .light : .dark)
  }
}

#Preview {
  MainCalculator()
}
