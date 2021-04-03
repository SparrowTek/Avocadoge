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
                    Label("Trade", systemImage: "arrow.left.arrow.right.circle")
                })
                .tag(MainTabs.trade)
            OverviewView()
                .tabItem({
                    Label("Overview", systemImage: "smallcircle.fill.circle")
                })
                .tag(MainTabs.overview)
            CommunityView()
                .tabItem({
                    Label("Community", systemImage: "newspaper")
                })
                .tag(MainTabs.community)
        }
        .accentColor(.barTint)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
