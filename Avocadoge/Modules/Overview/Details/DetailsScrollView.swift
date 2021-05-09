//
//  DetailsScrollView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/8/21.
//

import SwiftUI

struct DetailsScrollView: View {
    var body: some View {
        VStack {
            HStack {
                Text("OVERVIEW_DETAILS")
                    .foregroundColor(.primaryText)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                }
                .padding(.leading)
            }
        }
    }
}

struct DetailsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScrollView()
    }
}
