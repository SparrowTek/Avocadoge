//
//  ActionButtonView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/8/21.
//

import SwiftUI

struct ActionButtonView: View {
    var actionName: LocalizedStringKey
    var actionImage: String
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: actionImage)
                    .foregroundColor(.avoPurple)
                    .font(.system(size: 28, weight: .regular, design: .rounded))
                    .frame(width: 83, height: 83)
                    .background(
                        Rectangle()
                            .fill(Color.avoMediumPurple)
                            .cornerRadius(30.0)
                    )
                
                Text(actionName)
                    .foregroundColor(.avoPurple)
                    .font(.system(size: 11, weight: .regular, design: .rounded))
                    .padding(.top, 2)
            }
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(actionName: "WALLET_CODE", actionImage: "qrcode", action: {})
    }
}
