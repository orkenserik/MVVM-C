//
//  MainCoordinator.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

enum PresentationContext {
    case `default`
    case present(style: UIModalPresentationStyle)
}

class MainCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    weak var baseViewController: UIViewController?
    
    // MARK: - Methods
    
    func present(on baseVC: UIViewController, nextViewController: UIViewController, animated: Bool, context: PresentationContext) {
                
        baseViewController = baseVC
        
        switch context {
        case .default:
            let viewController = nextViewController
            DispatchQueue.main.async {
                baseVC.navigationController?.pushViewController(viewController, animated: true)
            }
        case .present(let style):
            let viewController = nextViewController
            viewController.modalPresentationStyle = style
            DispatchQueue.main.async {
                baseVC.navigationController?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func enqueueRoute(with context: Any?, animated: Bool) {}
    
    @objc func dismiss(animated: Bool) {}
    
}
