//
//  Hexagon.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/5/24.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.size.width, rect.size.height)
        let height = size
        let width = cos(.pi / 6) * height
        
        var path = Path()
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width, y: height / 4))
        path.addLine(to: CGPoint(x: width, y: 3 * height / 4))
        path.addLine(to: CGPoint(x: width / 2, y: height))
        path.addLine(to: CGPoint(x: 0, y: 3 * height / 4))
        path.addLine(to: CGPoint(x: 0, y: height / 4))
        path.closeSubpath()
        
        return path
    }
}
