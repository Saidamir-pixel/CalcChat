//
//  Model.swift
//  CalcChat
//
//  Created by Saidamir Navruzov on 06/09/2024.
//

import SwiftUI

enum Operation {
    case addition, subtract, multiply, divide, none
}

enum Buttons: String {
    case clear = "AC"
    case negative = "+/-"
    case percent = "%"
    case divide = "÷"
    case multiple = "*"
    case minus = "-"
    case plus = "+"
    case equal = "="
    case decimal = "."
    
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    
    var buttonColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color.customGrayCalcChat
        default:
            return Color.customOrangeCalcChat
        }
    }
}
