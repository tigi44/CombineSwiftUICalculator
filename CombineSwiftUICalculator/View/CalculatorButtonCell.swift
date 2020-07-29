//
//  CalculatorButtonCell.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/29.
//  Copyright © 2020 tigi44. All rights reserved.
//

import SwiftUI

struct CalculatorButtonCell: View {
    let name: String
    
    var body: some View {
        GeometryReader { geometry in
                Text(self.name)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.clear)
                    .cornerRadius(geometry.size.width / 4)
                    .overlay(RoundedRectangle(cornerRadius: geometry.size.width / 4).stroke(Color.blue, lineWidth: 2))
        }
    }
}


struct CalculatorButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonCell(name: "0")
    }
}
