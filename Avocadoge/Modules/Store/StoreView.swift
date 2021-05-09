//
//  StoreView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/5/21.
//

import SwiftUI

struct StoreView: View {
    @StateObject private var viewModel = StoreViewModel()
    
    var body: some View {
        VStack {
            if viewModel.showProgressBar {
                ProgressView(value: viewModel.progress)
            }
            WebView(url: .web(url: viewModel.storeURL), delegate: viewModel)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
