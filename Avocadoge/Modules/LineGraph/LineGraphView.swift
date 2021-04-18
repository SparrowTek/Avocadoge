//
//  LineGraphView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/18/21.
//

import SwiftUI

struct LineGraphView: View {
    var data: [Double]

    var body: some View {
        GeometryReader{ geometry in
            GeometryReader{ reader in
                Line(data: self.data, frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width, height: reader.frame(in: .local).height))
                )
                .offset(x: 0, y: 0)
            }
            .frame(width: geometry.frame(in: .local).size.width, height: geometry.frame(in: .local).size.height)
        }
    }
}

struct Line: View {
    var data: [Double]
    @Binding var frame: CGRect
    var color: Color = .avoPurple

    let padding:CGFloat = 30

    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.count-1)
    }
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data
        if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        if let min = min, let max = max, min != max {
            if (min <= 0){
                return (frame.size.height-padding) / CGFloat(max - min)
            }else{
                return (frame.size.height-padding) / CGFloat(max + min)
            }
        }

        return 0
    }
    var path: Path {
        let points = self.data
        return Path.lineChart(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }

    var body: some View {
        path
            .stroke(color ,style: StrokeStyle(lineWidth: 3, lineJoin: .round))
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .drawingGroup()
    }
}

struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView(data: [0.0, 1.2, 0.5, 3.0, 3.2, 3.3, 4.5, 4.4, 3.2, 1, 3, 4, 5.6])
    }
}
