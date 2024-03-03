//
//  Enumerations.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/1/24.
//

import Foundation

enum Operation {
  case add, subtract, multiply, divide, equal, none
}

enum CalcButton: String {
  // numerals
  case one =        "1"
  case two =        "2"
  case three =      "3"
  case four =       "4"
  case five =       "5"
  case six =        "6"
  case seven =      "7"
  case eight =      "8"
  case nine =       "9"
  case zero =       "0"
  case decimal =    "."
  case openParen =  "("
  case closeParen = ")"
  case negative =   "IMAGEplus.forwardslash.minus"
  
  // operators etc.
  case add =        "+"
  case subtract =   "-"
  case multiply =   "✕"
  case divide =     "÷"
  case equal =      "="
  case percent =    "%"
  case undo =       "IMAGEdelete.left.fill"
  case star =       "IMAGEstar"
}

let enumOperators: [CalcButton] = [.subtract, .add, .multiply, .divide]

let multiplySymbol: String = CalcButton.multiply.rawValue
let divisionSymbol: String = CalcButton.divide.rawValue

let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"

