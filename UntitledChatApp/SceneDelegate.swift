//
//  AppDelegate.swift
//  UntitledChatApp
//
//  Created by Herbie on 3/27/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let nav = UINavigationController(rootViewController: ConversationsController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
    }
}

