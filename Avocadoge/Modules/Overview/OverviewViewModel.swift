//
//  OverviewViewModel.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/5/21.
//

import Foundation
import SwiftUI

class OverviewViewModel: ObservableObject {
    @Published var welcomeMessage: LocalizedStringKey = "WELCOME_MESSAGE"
}
