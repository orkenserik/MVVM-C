//
//  Initial Configurations.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import IQKeyboardManager
import UIKit

protocol InitialConfigurationsProtocol: class {
    
    func load(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    
}

class InitialConfigurations: InitialConfigurationsProtocol {
    
    func load(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        configureKeyboardManager()
    }
    
}

//MARK: - Methods
extension InitialConfigurations {
    
    private func configureKeyboardManager() {
        let keyboardManager = IQKeyboardManager.shared()
        keyboardManager.shouldShowToolbarPlaceholder = false
        keyboardManager.shouldResignOnTouchOutside = true
    }
}
