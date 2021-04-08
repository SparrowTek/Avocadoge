//
//  OverviewHeaderView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/5/21.
//

import SwiftUI

struct OverviewHeaderView: View {
    var viewModel: OverviewViewModel
    @Binding var shouldShowSettings: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { shouldShowSettings.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 38))
                        .foregroundColor(.avoPurple)
                }
            }
            
            HStack {
                Text(viewModel.welcomeMessage)
                    .foregroundColor(.avoPurple)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                Spacer()
            }
        }
        .padding([.top, .leading, .trailing])
    }
}

struct OverviewHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewHeaderView(viewModel: OverviewViewModel(), shouldShowSettings: .constant(false))
            .background(Color.avoDarkPurple)
    }
}
