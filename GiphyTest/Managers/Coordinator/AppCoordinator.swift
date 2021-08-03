//
//  AppCoordinator.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: class {
    func presentInitial()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    
    // MARK: - Properties
    static let shared: AppCoordinatorProtocol = AppCoordinator()
    
    // MARK: - Methods
    
    private func presentSearchGiphy() {
        let router = SearchGiphy()
        let viewController = GiphyListController(viewModel: GiphyViewModel(), router: router)
        router.baseViewController = viewController
        UIApplication.shared.window.rootViewController = UINavigationController(rootViewController: viewController)
        UIApplication.shared.window.makeKeyAndVisible()
    }
    
    func presentInitial() {
        presentSearchGiphy()
    }
    
}

extension AppCoordinator {
    private func presentNavigationController(with rootViewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        UIApplication.shared.window.rootViewController = navigationController
        UIApplication.shared.window.makeKeyAndVisible()
    }
    
}
