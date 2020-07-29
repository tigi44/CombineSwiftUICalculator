//
//  ContentView.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/27.
//  Copyright © 2020 tigi44. All rights reserved.
//

import SwiftUI

let collectionViewData: [[CalculatorButton]] = [[CalculatorButton.clear, CalculatorButton.plus, CalculatorButton.subtract, CalculatorButton.multiply],
                                                 [CalculatorButton.number("1"), CalculatorButton.number("2"), CalculatorButton.number("3"), CalculatorButton.divide],
                                                 [CalculatorButton.number("4"), CalculatorButton.number("5"), CalculatorButton.number("6"), CalculatorButton.equals],
                                                 [CalculatorButton.number("7"), CalculatorButton.number("8"), CalculatorButton.number("9"), CalculatorButton.empty],
                                                 [CalculatorButton.number("0"), CalculatorButton.dot]]

struct ContentView: View {
    @ObservedObject private var viewModel: CalculatorViewModel = CalculatorViewModel()
    
    let width = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            CalculatorResultLabelView(text: viewModel.labelString)
                .frame(width: width, height: 50)
            CalculatorCollectionView(viewModel: viewModel, datas: collectionViewData, viewWidth: width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .environment(\.colorScheme, .light)

           ContentView()
              .environment(\.colorScheme, .dark)
        }
    }
}
