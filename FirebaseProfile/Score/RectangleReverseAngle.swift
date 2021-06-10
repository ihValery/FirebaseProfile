//
//  RectangleReverseAngle.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct RectangleReverseAngle: Shape {
    var startY: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: rect.width, y: startY)
        
        var path = Path()
        
        path.move(to: startPoint)
        path.addQuadCurve(to: CGPoint(x: rect.width - 70, y: startY + 70),
                          control: CGPoint(x: rect.width, y: startY + 70))
        path.addLine(to: CGPoint(x: 80, y: startY + 70))
        path.addQuadCurve(to: CGPoint(x: 10, y: startY + 140),
                          control: CGPoint(x: 10, y: startY + 70))
        path.addLine(to: CGPoint(x: 10, y: rect.height))
//        path.addQuadCurve(to: CGPoint(x: 80, y: rect.height - 10),
//                          control: CGPoint(x: 10, y: rect.height - 10))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()

        return path
    }
}
