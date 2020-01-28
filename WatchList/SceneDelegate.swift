//
//  SceneDelegate.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let webService = WebService(configuration: .default)
        let watchListsAssembly = WatchListsAssembly(webService: webService)
        let navigationController = UINavigationController(rootViewController: watchListsAssembly.viewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

