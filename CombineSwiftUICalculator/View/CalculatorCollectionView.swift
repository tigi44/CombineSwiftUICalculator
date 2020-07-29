//
//  CalculatorCollectionView.swift
//  CombineSwiftUICalculator
//
//  Created by tigi on 2020/07/29.
//  Copyright © 2020 tigi44. All rights reserved.
//

import SwiftUI

struct CalculatorCollectionView: View {
    
    let viewModel: CalculatorViewModel
    let datas: [[CalculatorButton]]
    let viewWidth: CGFloat
    
    let vSpacing: CGFloat = 10
    let hSpacing: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: self.vSpacing) {
            ForEach(datas, id:\.self) { rows in
                HStack(spacing: self.hSpacing) {
                    ForEach(rows, id:\.self) { data in
                        CalculatorButtonCell(name: data.text())
                            .frame(width: self.cellSize(), height: self.cellSize())
                            .onTapGesture {
                                self.viewModel.didTapSubject.send(data)
                        }
                    }
                }
            }
        }
    }
    
    func cellSize() -> CGFloat {
        let countOfColumn = 4
        let spacing: CGFloat = CGFloat(countOfColumn - 1) * self.hSpacing
        return CGFloat((self.viewWidth - spacing) / CGFloat(countOfColumn))
    }
}

struct CalculatorCollectionView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        return CalculatorCollectionView(viewModel: CalculatorViewModel(), datas: [[CalculatorButton.number("0"), CalculatorButton.number("1")], [CalculatorButton.number("0"), CalculatorButton.number("1")], [CalculatorButton.number("1")]], viewWidth: 400)
    }
}
