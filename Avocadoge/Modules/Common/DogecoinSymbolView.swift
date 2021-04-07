//
//  DogecoinSymbolView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/7/21.
//

import SwiftUI

struct DogecoinSymbolView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.avoWhite)
                .frame(width: 14, height: 5)
                .offset(x: -10)
            Text("D")
                .foregroundColor(.avoWhite)
                .font(.system(size: 36, weight: .bold))
        }
        .background(
            Circle()
                .fill(Color.avoPurple)
                .frame(width: 60, height: 60)
        )
    }
}

struct DogecoinSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        DogecoinSymbolView()
    }
}
