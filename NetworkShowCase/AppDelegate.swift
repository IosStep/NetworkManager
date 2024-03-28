//
//  AppDelegate.swift
//  NetworkShowCase
//
//  Created by Aldiyar Aitpayev on 04.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = CharactersViewController()
        let presenter = CharactersPresenter()
        vc.presenter = presenter
        presenter.view = vc
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}

