//
//  ProgressViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class ProgressViewController: BaseViewController {
    
    override func setupTabBarItem() {
        super.setupTabBarItem()
        let tabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis.rtl"), selectedImage: UIImage(systemName: "rectangle.and.pencil.and.ellipsis.rtl"))
        self.tabBarItem = tabBarItem
    }
    
    override func attribute() {
        super.attribute()
        //Self
        navigationItem.title = "Progress"
    }
}
