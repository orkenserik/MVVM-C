//
//  Constants.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

struct App {
    
    // MARK: - GiphyApiKey
    static let GiphyAPIKey = "imvLCklLo2jFXBi3vCWrlox4UoHz9bYF"

    // MARK: - Cell Identifiers

    struct CellIdentifier {
        static let gifCellId = "gifCellId"
    }
    
    // MARK: - UserDefaults
    
    struct ScreenSize {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
    }
}

// MARK: - Notifications

extension Foundation.Notification.Name {
    static let startLoading = Foundation.Notification.Name("startLoading")
    static let stopLoading = Foundation.Notification.Name("stopLoading")
}
