//
//  LineGraphWithAxisView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/18/21.
//

import SwiftUI

struct LineGraphWithAxisView: View {
    let data: [Double] = [0.4, 0.6, 0.5, 0.4, 1.2, 1.4, 1.5, 1.4, 1.5, 1.2, 2.2, 3.8, 2.2, 1.4]
    let yAxisValues = ["42", "40", "38", "36"]

    var body: some View {
        VStack {
            HStack {
                LineGraphView(data: data)
                VStack {
                    ForEach(0..<yAxisValues.count) { index in
                        Spacer()
                        Text(yAxisValues[index])
                            .foregroundColor(.avoWhite)
                            .font(.system(size: 12, weight: .medium))
                    }
                }
            }
            Rectangle()
                .fill(Color.avoWhite.opacity(0.4))
                .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                .cornerRadius(3)
        }
        .padding()
        .background(Color.avoMediumPurple)
    }
}

struct LineGraphWithAxisView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphWithAxisView()
            .frame(height: 200)
    }
}
