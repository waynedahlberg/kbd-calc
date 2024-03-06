//
//  CalculatorButtonsView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI
import MathParser

struct CalcButtonModel: Identifiable {
  let id = UUID()
  let calcButton: CalcButton
  var color: Color = .foregroundDigits
  var theme: ButtonTheme = .classic
}

struct RowOfCalculatorButtonsModel: Identifiable {
  let id = UUID()
  let row: [CalcButtonModel]
}

struct CalculatorButtonsView: View {
  // State
  @State private var currentButtonTheme: ButtonTheme = .classic
  @State private var currentDisplayTheme: DisplayTheme = .basic
  
  @Binding var currentComputation: String
  @Binding var mainResult: String
  
  // Properties
  let buttonData: [RowOfCalculatorButtonsModel] = [
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .clear, color: .ledblue),
      CalcButtonModel(calcButton: .negative, color: .op1Gray),
      CalcButtonModel(calcButton: .percentage, color: .op1Gray),
      CalcButtonModel(calcButton: .divide, color: .op1Gray)
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .seven),
      CalcButtonModel(calcButton: .eight),
      CalcButtonModel(calcButton: .nine),
      CalcButtonModel(calcButton: .multiply, color: .op1Gray),
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .four),
      CalcButtonModel(calcButton: .five),
      CalcButtonModel(calcButton: .six),
      CalcButtonModel(calcButton: .subtract, color: .op1Gray),
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .one),
      CalcButtonModel(calcButton: .two),
      CalcButtonModel(calcButton: .three),
      CalcButtonModel(calcButton: .add, color: .op1Gray),
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .undo, color: .burnedOrange),
      CalcButtonModel(calcButton: .zero),
      CalcButtonModel(calcButton: .decimal),
      CalcButtonModel(calcButton: .equal),
    ])
  ]
  
  // Body
  var body: some View {
    Grid() {
      ForEach(buttonData) { row in
        GridRow {
          ForEach(row.row) { button in
            Button(action: {
              // logic
              buttonPressed(calcButton: button.calcButton)
            }, label: {
              ButtonView(currentButtonTheme: $currentButtonTheme, calcButton: button.calcButton,
                         fgColor: button.color,
                         bgColor: .buttonBG)
            })
          }
        }
      }
    }
  }
  
  // Button press action
  func buttonPressed(calcButton: CalcButton) {
    // func logic
    switch calcButton {
    
    case .clear:
      currentComputation = ""
      mainResult = "0"
      
    case .equal, .negative:
      if !currentComputation.isEmpty {
        if !lastCharacterIsAnOperator(str: currentComputation) {
          let sign = calcButton == .negative ? -1.0 : 1.0
          mainResult = formatResult(val: sign * calculateResults())
          
          if calcButton == .negative {
            currentComputation = mainResult
          }
        }
      }
      
    case .decimal:
      if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
        if lastCharIsDigit(str: currentComputation) {
          let startIndex = currentComputation.index(lastOccurenceOfDecimal, offsetBy: 1)
          let endIndex = currentComputation.endIndex
          let range = startIndex..<endIndex
          
          let rightSubstring = String(currentComputation[range])
          
          // only have digits to the right "."
          // that means do not add another "."
          // otherwise we can add another point
          if Int(rightSubstring) == nil && !rightSubstring.isEmpty {
            currentComputation += "."
          }
        }
      } else {
        if currentComputation.isEmpty {
          currentComputation += "0."
        }else if lastCharIsDigit(str: currentComputation) {
          currentComputation += "."
        }
      }
      
    case .percentage:
      if lastCharIsDigit(str: currentComputation) {
        appendToCurrentComputation(calcButton: calcButton)
      }
      
    case .add, .subtract, .multiply, .divide:
      if lastCharIsDigit(str: currentComputation) {
        appendToCurrentComputation(calcButton: calcButton)
      }
      
    case .undo:
      currentComputation = String(currentComputation.dropLast())
      
    default:
      // 1 0
      appendToCurrentComputation(calcButton: calcButton)
    }
  }
  
  // Actual computation
  func calculateResults() -> Double {
    let visibleWorkings: String = currentComputation
    var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*.01")
    workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
    workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")

    //  if "35." will be replaced by "35.0"
    if getLastChar(str: visibleWorkings) == "." {
      workings += "0"
    }
    
    do {
      let double = try workings.evaluate()
      return double.rounded(toPlaces: 7)
    } catch {
      print("DD eval fail: \(error.localizedDescription)")
      return 0.0
    }
  }
  
  func appendToCurrentComputation(calcButton: CalcButton) {
    currentComputation += calcButton.rawValue
  }
}

#Preview {
  CalculatorButtonsView(currentComputation: .constant("5 + 17"), mainResult: .constant("22"))
}
