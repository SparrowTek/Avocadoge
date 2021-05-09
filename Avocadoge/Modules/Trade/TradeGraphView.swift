//
//  TradeGraphView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/18/21.
//

import SwiftUI

struct TradeGraphView: View {
    var body: some View {
        VStack {
            Text("$0.3023495")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundColor(.primaryText)
                .padding(.bottom, 2)
                .padding(.top)
            Text("+ 3.45%")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.avoGreen)
            HStack {
                Spacer()
                TradeGraphRangeButtonView(title: "1H", isCurrentSelection: false, action: {})
                TradeGraphRangeButtonView(title: "1D", isCurrentSelection: true, action: {})
                TradeGraphRangeButtonView(title: "1W", isCurrentSelection: false, action: {})
                TradeGraphRangeButtonView(title: "1M", isCurrentSelection: false, action: {})
                TradeGraphRangeButtonView(title: "1Y", isCurrentSelection: false, action: {})
                TradeGraphRangeButtonView(title: "All", isCurrentSelection: false, action: {})
                    .padding(.trailing)
                
            }
            .padding()
            LineGraphWithAxisView()
                .frame(width: 329, height: 150)
        }
        .frame(width: 329, height: 300)
        .background(Color.secondaryBackground)
        .cornerRadius(30)
    }
}

struct TradeGraphRangeButtonView: View {
    var title: String
    var isCurrentSelection: Bool
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Text(title)
                    .foregroundColor(isCurrentSelection ? .avoPurple : .primaryText)
                    .font(.system(size: 13))
                Rectangle()
                    .fill(isCurrentSelection ? Color.avoPurple : Color.clear)
                    .frame(width: 15, height: 2)
            }
        }
    }
}

struct TradeGraphView_Previews: PreviewProvider {
    static var previews: some View {
        TradeGraphView()
    }
}
