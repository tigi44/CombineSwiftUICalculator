//
//  CalculatorButtonEnum.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/29.
//  Copyright © 2020 tigi44. All rights reserved.
//

import Foundation

//MARK: ENUM - CalculatorButton
enum CalculatorButton: Hashable {
    case clear, empty, dot
    case number(String)
    case plus, subtract, multiply, divide, equals
    
    func text() -> String {
        switch self {
        case .clear:
            return "clear"
        case .empty:
            return ""
        case .dot:
            return "."
        case let .number(value):
            return value
        case .plus:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        case .equals:
            return "="
        }
    }
    
    func execute(_ first: NSNumber, _ second: NSNumber) -> NSNumber {
        switch self {
        case .plus:
            return NSDecimalNumber(decimal: first.decimalValue).adding(NSDecimalNumber(decimal: second.decimalValue))
        case .subtract:
            return NSDecimalNumber(decimal: first.decimalValue).subtracting(NSDecimalNumber(decimal: second.decimalValue))
        case .multiply:
            return NSDecimalNumber(decimal: first.decimalValue).multiplying(by: NSDecimalNumber(decimal: second.decimalValue))
        case .divide:
            return NSDecimalNumber(decimal: first.decimalValue).dividing(by: NSDecimalNumber(decimal: second.decimalValue))
        case .equals:
            return first
        default:
            return first
        }
    }
}
