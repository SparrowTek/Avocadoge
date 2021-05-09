//
//  MainTabView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/3/21.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = MainTabViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.tab) {
            TradeView()
                .tabItem({
                    Label("TRADE", systemImage: "arrow.left.arrow.right")
                })
                .tag(MainTabs.trade)
            OverviewView()
                .tabItem({
                    Label("OVERVIEW", systemImage: "chart.pie")
                })
                .tag(MainTabs.overview)
            CommunityView()
                .tabItem({
                    Label("COMMUNITY", systemImage: "newspaper")
                })
                .tag(MainTabs.community)
            StoreView()
                .tabItem({
                    Label("STORE", systemImage: "cart")
                })
                .tag(MainTabs.store)
        }
        .accentColor(.barTint)
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color.primaryBackground)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
