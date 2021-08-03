//
//  SearchGiphy.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

class SearchGiphy: MainCoordinator {
    
    // MARK: - Enums
    enum RouteType {
        case detail
    }
    
    override func enqueueRoute(with context: Any?, animated: Bool) {
        
        guard let routeType = context as? RouteType else {
            assertionFailure("The route type mismatch")
            return
        }
        
        guard let baseVC = baseViewController else {
            assertionFailure("baseViewController is not set")
            return
        }
        
        switch routeType {
        case .detail:
            let vc = GiphyListController(viewModel: GiphyViewModel(), router: self)
            self.present(on: baseVC, nextViewController: vc, animated: animated, context: .default)
        
        default:
            break
        }
    }
    
    override func dismiss(animated: Bool) { }
    
}


