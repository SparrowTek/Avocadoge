//
//  Path.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/18/21.
//

import SwiftUI

extension Path {

    static func lineChart(points:[Double], step:CGPoint) -> Path {
        var path = Path()
        guard points.count >= 2,
              let offset = points.min() else {
            return path
        }
        
        let p1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)
        path.move(to: p1)

        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex] - offset))
            path.addLine(to: p2)
        }

        return path
    }
}
