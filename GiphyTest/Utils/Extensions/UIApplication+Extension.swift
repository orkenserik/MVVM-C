//
//  UIApplication+Extension.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation
import UIKit

extension UIApplication {
    
    static var applicationVersionNumber: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static var applicationBuildNumber: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier!
    }
    
    class func openAppSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    
    func open(url:URL) {
        if #available(iOS 10.0, *) {
            self.open(url)
        } else {
            self.openURL(url)
        }
    }
    
    static func requestPermissionToShowPushNotification() {
        
        let app = UIApplication.shared
        let unCenter = UNUserNotificationCenter.current()
        unCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            //Parse errors and track state
        }
        
        app.registerForRemoteNotifications()
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
    
    // MARK: - Properties
    var window: UIWindow {
        guard let window = windows.first else { return UIWindow(frame: UIScreen.main.bounds) }
        
        return window
    }
    
    // MARK: - Methods
    func topViewController(controller: UIViewController? = UIApplication.shared.window.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController,
            let selectedViewController = tabController.selectedViewController {
            return topViewController(controller: selectedViewController)
        }
        
        if let presentedViewController = controller?.presentedViewController {
            return topViewController(controller: presentedViewController)
        }
        
        return controller
    }
    
}
