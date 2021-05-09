//
//  TradeView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/3/21.
//

import SwiftUI

struct TradeView: View {
    var body: some View {
        ZStack {
            Color.primaryBackground
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("TRADE")
                        .foregroundColor(.primaryText)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding()
                TradeGraphView()
                    .padding()
                HStack {
                    Button("BUY", action: {})
                        .frame(width: 153, height: 59)
                        .foregroundColor(.avoWhite)
                        .font(.system(size: 18, weight: .bold))
                        .background(
                            Capsule()
                                .fill(Color.avoPurple)
                        )
                        .padding()
                    
                    Button("SELL", action: {})
                        .frame(width: 153, height: 59)
                        .foregroundColor(.avoWhite)
                        .font(.system(size: 18, weight: .bold))
                        .background(
                            Capsule()
                                .fill(Color.avoRed)
                        )
                        .padding()
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
