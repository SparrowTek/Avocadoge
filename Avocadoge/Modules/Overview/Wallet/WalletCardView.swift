//
//  WalletCardView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/7/21.
//

import SwiftUI

struct WalletCardView: View {
    var accountValue: String
    var walletAddress: String
    var isDefaultWallet: Bool
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack {
                    HStack {
                        VStack {
                            DogecoinSymbolView()
                                .padding([.top, .bottom])
                            Text("DOGECOIND")
                                .font(.system(size: 13, weight: .regular, design: .rounded))
                                .foregroundColor(.secondaryText)
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Text(accountValue)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.primaryText)
                        Spacer()
                    }
                    .padding([.top, .leading])
                }
                
                VStack {
                    Text(walletAddress)
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(.secondaryText)
                        .padding([.top, .trailing])
                    if isDefaultWallet {
                        DefaultPillView()
                            .padding()
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .frame(width: 295, height: 200)
        .background(Color.secondaryBackground)
        .cornerRadius(30.0)
    }
}

struct DefaultPillView: View {
    var body: some View {
        Text("DEFAULT")
            .font(.system(size: 13, weight: .regular, design: .rounded))
            .foregroundColor(.pillText)
            .background(
                Capsule()
                    .fill(Color.avoGreen)
                    .frame(width: 76, height: 26)
            )
    }
}

struct WalletCardView_Previews: PreviewProvider {
    static var previews: some View {
        WalletCardView(accountValue: "18.3K DOGE", walletAddress: "**** **** 2452", isDefaultWallet: true, action: {})
    }
}
