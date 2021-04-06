//
//  MainTabViewModel.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/3/21.
//ß

import Foundation
import UIKit

enum MainTabs {
    case trade
    case overview
    case community
    case store
}

class MainTabViewModel: ObservableObject {
    @Published var tab: MainTabs = .overview
}
