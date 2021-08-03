//
//  AppDelegate.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        InitialConfigurations().load(application: application, launchOptions: launchOptions)
        AppCoordinator.shared.presentInitial()
        return true
    }


}

