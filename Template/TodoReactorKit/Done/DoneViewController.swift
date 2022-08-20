//
//  DoneViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class DoneViewController: BaseViewController {
    
    override func setupTabBarItem() {
        super.setupTabBarItem()
        let tabBarItem = UITabBarItem(title: "Done", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder"))
        self.tabBarItem = tabBarItem
    }
    
    override func attribute() {
        super.attribute()
        //Self
        navigationItem.title = "DONE"
    }
}
