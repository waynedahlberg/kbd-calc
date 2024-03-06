//
//  ExpressionTestView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/5/24.
//

import SwiftUI

struct ExpressionTestView: View {
  var body: some View {
    VStack {
      Text("25 ÷ 10")
      Button(action: {
        performEvaluation()
      }, label: {
        Text("Perform evalution")
      })
    }  
  }
  
  func performEvaluation() {
    // Diagnostic test
    let diagnosticExpr = NSExpression(format: "25.0 / 10.0")
    let diagnosticResult = diagnosticExpr.expressionValue(with: nil, context: nil) as? Double
    print("Diagnostic Test Result: \(diagnosticResult ?? 0)")

  }
}

#Preview {
  ExpressionTestView()
}
