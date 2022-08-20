//
//  MainTabBarController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class MainTabBarController: BaseTabBarController {
    
    override func attribute() {
        super.attribute()
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        UITabBar.clearShadow()
        tabBar.addShadow()
    }
}
