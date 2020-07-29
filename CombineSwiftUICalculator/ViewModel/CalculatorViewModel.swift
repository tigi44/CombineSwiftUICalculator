//
//  CalculatorViewModel.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/29.
//  Copyright © 2020 tigi44. All rights reserved.
//

import Combine
import SwiftUI

class CalculatorViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []
    let didTapSubject = PassthroughSubject<CalculatorButton, Never>()
    
    private var lastOperator: CalculatorButton?
    private var lastNumber: NSNumber = 0
    private var currentNumber: NSNumber = 0
    @Published private(set) var labelString: String = "0"
    
    init() {
        setupObservable()
    }
    
    private func setupObservable() {
        
        let subscription = didTapSubject
            .print("CalculatorButton")
            .sink { calculatorButton in
                switch calculatorButton {
                case .plus, .subtract, .multiply, .divide, .equals:
                    self.inputOperator(calculatorButton)
                    break
                case .clear:
                    self.inputClear()
                    break
                case .empty:
                    break
                case .dot:
                    self.inputDot()
                    break
                case let .number(value):
                    self.inputNumber(value)
                    break
                }
        }

        cancellables = [subscription]
    }
}

extension CalculatorViewModel {
    private func inputNumber(_ number: String) {
        let dotString = self.labelString.hasSuffix(".") ? "." : ""
        
        self.currentNumber = NSNumber(value: Double("\(self.currentNumber)" + dotString + number) ?? 0)
        self.labelString = "\(self.currentNumber)"
    }
    
    private func inputDot() {
        if !self.labelString.contains(".") {
            self.labelString = self.labelString + "."
        }
    }
    
    private func inputClear() {
        self.lastOperator = nil
        self.lastNumber = 0
        self.currentNumber = 0
        self.labelString = "\(self.currentNumber)"
    }
    
    
    private func executeLastOperator() -> NSNumber {
        let result: NSNumber!

        if let lastOperator = self.lastOperator {
            result = lastOperator.execute(self.lastNumber, self.currentNumber)
            self.labelString = "\(result!)"
        } else {
            result = self.currentNumber
        }

        return result
    }

    private func inputOperator(_ inputOperator: CalculatorButton) {
        let result = executeLastOperator()
        
        self.lastOperator = inputOperator
        self.lastNumber = result
        self.currentNumber = 0
    }
}
