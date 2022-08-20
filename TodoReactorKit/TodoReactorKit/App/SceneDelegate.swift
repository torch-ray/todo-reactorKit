//
//  SceneDelegate.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let tabBarVC = MainTabBarController()
        let todoVC = TodoViewController()
        let todoNav = TodoNavigationController(rootViewController: todoVC)
        let progressVC = ProgressViewController()
        let doneVC = DoneViewController()

        tabBarVC.viewControllers = [todoNav, progressVC, doneVC]

        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }
}

