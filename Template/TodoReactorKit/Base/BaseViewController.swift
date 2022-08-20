//
//  BaseViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        attribute()
        layout()
        bind()
    }
    
    func setupTabBarItem() { }
    func attribute() { }
    func layout() { }
    func bind() { }
}
