//
//  UITabBar+Extension.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

extension UITabBar {

    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
