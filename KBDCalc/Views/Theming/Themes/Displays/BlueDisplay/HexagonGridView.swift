//
//  HexagonGridView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/5/24.
//

import SwiftUI

struct HexagonGridView: View {
    let rows: Int
    let columns: Int
    let hexagonSize: CGFloat
    let strokeColor: Color
    
    private var hexagonHeight: CGFloat {
        return hexagonSize
    }
    
    private var hexagonWidth: CGFloat {
        return cos(.pi / 6) * hexagonHeight
    }
    
    var body: some View {
        VStack(spacing: -hexagonSize / 4) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<columns, id: \.self) { column in
                        Hexagon()
                        .stroke(strokeColor, lineWidth: 0.15)
                            .frame(width: hexagonWidth, height: hexagonHeight)
                            .offset(x: (row % 2 != 0 ? hexagonWidth / 2 : 0))
                    }
                }
            }
        }
    }
}


#Preview {
  HexagonGridView(rows: 8, columns: 56, hexagonSize: 8, strokeColor: .blue)
}
