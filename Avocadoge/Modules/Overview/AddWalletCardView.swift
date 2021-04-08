//
//  AddWalletCardView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/8/21.
//

import SwiftUI

struct AddWalletCardView: View {
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: "plus.circle")
                    .font(.system(size: 38, weight: .bold))
                    .foregroundColor(.avoPurple)
            }
        }
        .frame(width: 113, height: 200)
        .background(Color.avoMediumPurple)
        .cornerRadius(30.0)
    }
}

struct AddWalletCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddWalletCardView(action: {})
    }
}
