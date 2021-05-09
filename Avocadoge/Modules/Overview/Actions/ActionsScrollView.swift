//
//  ActionsScrollView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/8/21.
//

import SwiftUI

struct ActionsScrollView: View {
    var body: some View {
        VStack {
            HStack {
                Text("QUICK_ACTIONS")
                    .foregroundColor(.primaryText)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ActionButtonView(actionName: "WALLET_CODE", actionImage: "qrcode", action: {})
                        .padding(.trailing)
                    ActionButtonView(actionName: "SCAN_CODE", actionImage: "camera", action: {})
                        .padding(.trailing)
                    ActionButtonView(actionName: "ANALYTICS", actionImage: "chart.bar", action: {})
                        .padding(.trailing)
                    ActionButtonView(actionName: "SHOP_MERCH", actionImage: "cart", action: {})
                        .padding(.trailing)
                    ActionButtonView(actionName: "SHARE_APP", actionImage: "square.and.arrow.up", action: {})
                        .padding(.trailing)
                }
                .padding(.leading)
            }
        }
    }
}

struct ActionsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsScrollView()
            .background(Color.primaryBackground)
    }
}
