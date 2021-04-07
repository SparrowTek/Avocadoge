//
//  OverviewView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/3/21.
//

import SwiftUI

struct OverviewView: View {
    @State private var shouldShowSettings = false
    @StateObject private var viewModel = OverviewViewModel()
    
    var body: some View {
        ZStack {
            Color.avoDarkPurple
                .ignoresSafeArea()
            OverviewHeaderView(viewModel: viewModel, shouldShowSettings: $shouldShowSettings)
            WalletCardView(accountValue: "18.7 K DOGE", walletAddress: "**** **** 4254", isDefaultWallet: true)
        }
        .sheet(isPresented: $shouldShowSettings) {
            SettingsView()
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
