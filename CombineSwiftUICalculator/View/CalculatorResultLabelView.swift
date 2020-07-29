//
//  CalculatorResultLabelView.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/29.
//  Copyright © 2020 tigi44. All rights reserved.
//

import SwiftUI

struct CalculatorResultLabelView: View {
    let text: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: geometry.size.height / 4)
                    .stroke(Color.gray, lineWidth: 2)
                    .foregroundColor(.clear)
                Text(self.text)
                    .font(.body)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CalculatorResultLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorResultLabelView(text: "0")
    }
}
