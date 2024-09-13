//
//  Extension.swift
//  CalcChat
//
//  Created by Saidamir Navruzov on 07/09/2024.
//

import SwiftUI

extension Color {
    static let customGrayCalcChat = Color("grayCalcChat")
    static let customOrangeCalcChat = Color("orangeCalcChat")
}

extension Buttons {
    func itemOperations() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtract
        case .divide:
            return .divide
        case .multiple:
            return .multiply
        default:
            return .none
        }
    }
}
