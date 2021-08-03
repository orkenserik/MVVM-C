//
//  RouterProtocol.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import UIKit

protocol CoordinatorProtocol: class {
    
    var baseViewController: UIViewController? { get set }
    
    func present(on baseViewController: UIViewController, nextViewController: UIViewController, animated: Bool, context: PresentationContext)
    func enqueueRoute(with context: Any?, animated: Bool)
    func dismiss(animated: Bool)
    
}

extension CoordinatorProtocol {
    
    // MARK: - Router default methods
    func present(on baseViewController: UIViewController, nextViewController: UIViewController, context: PresentationContext) {
        present(on: baseViewController, nextViewController: nextViewController, animated: true, context: context)
    }
    
    func enqueueRoute(with context: Any?) {
        enqueueRoute(with: context, animated: true)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
    
}



