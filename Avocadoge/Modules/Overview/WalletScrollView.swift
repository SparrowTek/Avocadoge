//
//  WalletScrollView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/8/21.
//

import SwiftUI

struct WalletScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            #warning("change this to a LazyHGrid once the model is created")
            HStack {
                WalletCardView(accountValue: "18.7 K DOGE", walletAddress: "**** **** 4254", isDefaultWallet: true)
                    .padding(.trailing)
                WalletCardView(accountValue: "12 DOGE", walletAddress: "**** **** 1256", isDefaultWallet: false)
                    .padding(.trailing)
                AddWalletCardView(action: {
                    print("Add new wallet")
                })
                .padding(.trailing)
            }
            .padding(.leading)
        }
    }
}

struct WalletScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WalletScrollView()
    }
}
