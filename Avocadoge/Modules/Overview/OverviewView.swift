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
            Color.primaryBackground
                .ignoresSafeArea()
            
            VStack {
                OverviewHeaderView(viewModel: viewModel, shouldShowSettings: $shouldShowSettings)
                WalletScrollView()
                ActionsScrollView()
                DetailsScrollView()
                Spacer()
            }
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
