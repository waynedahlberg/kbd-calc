//
//  CalculatorButtonsView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import SwiftUI

struct CalcButtonModel: Identifiable {
  let id = UUID()
  let calcButton: CalcButton
  var color: Color = .foregroundDigits
}

struct RowOfCalculatorButtonsModel: Identifiable {
  let id = UUID()
  let row: [CalcButtonModel]
}

struct CalculatorButtonsView: View {
  // State
  @Binding var currentComputation: String
  @Binding var mainResult: String
  
  // Properties
  let buttonData: [RowOfCalculatorButtonsModel] = [
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .clear, color: .ledblue),                   // Clear      C
      CalcButtonModel(calcButton: .negative, color: .op1Gray),                // Negative   +/-
      CalcButtonModel(calcButton: .percentage, color: .op1Gray),              // Percent    %
      CalcButtonModel(calcButton: .divide, color: .op1Gray)                   // Divide     /
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .seven),                                    // Seven      7
      CalcButtonModel(calcButton: .eight),                                    // Eight      8
      CalcButtonModel(calcButton: .nine),                                     // Nine       9
      CalcButtonModel(calcButton: .multiply, color: .op1Gray),                // Multiply   ✕
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .four),                                     // Four       4
      CalcButtonModel(calcButton: .five),                                     // Five       5
      CalcButtonModel(calcButton: .six),                                      // Six        6
      CalcButtonModel(calcButton: .subtract, color: .op1Gray),                // Subtract   -
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .one),                                      // One        1
      CalcButtonModel(calcButton: .two),                                      // Two        2
      CalcButtonModel(calcButton: .three),                                    // Three      3
      CalcButtonModel(calcButton: .add, color: .op1Gray),                     // Add        +
    ]),
    RowOfCalculatorButtonsModel(row: [
      CalcButtonModel(calcButton: .undo, color: .burnedOrange),               // Undo       ←
      CalcButtonModel(calcButton: .zero),                                     // Zero       0
      CalcButtonModel(calcButton: .decimal),                                  // Decimal    .
      CalcButtonModel(calcButton: .equal),                                    // Equals     =
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
              ButtonView(calcButton: button.calcButton,
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
//    workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
//    workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
//  
    
    workings = "25/10"
    // if "35." will be replaced by "35.0"
    if getLastChar(str: visibleWorkings) == "." {
      workings += "0"
    }
    
    // manual evaluation WORKS!
    let numerator = 25.0
    let denominator = 10.0
    let manualResult = numerator / denominator
    print("manual division result: \(manualResult)")
    
    // explicit testing
    let explicitWorkings = "25.0 / 10.0"
    let explicitExpr = NSExpression(format: explicitWorkings)
    let explicitExprValue = explicitExpr.expressionValue(with: nil, context: nil) as! Double
    print("Explicit result with float: \(explicitExprValue)")
    
    
    // keypoint
    let expr = NSExpression(format: workings)
    
    let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
    print("value of expr: \(expr)")
    print("value of exprValue: \(exprValue)")
    return exprValue
  }
  
  func appendToCurrentComputation(calcButton: CalcButton) {
    currentComputation += calcButton.rawValue
  }
}

#Preview {
  CalculatorButtonsView(currentComputation: .constant("5 + 17"), mainResult: .constant("22"))
}
