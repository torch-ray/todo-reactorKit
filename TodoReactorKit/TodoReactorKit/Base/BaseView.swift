//
//  BaseView.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
        bind()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        attribute()
        layout()
        bind()
    }

    func attribute() { }
    func layout() { }
    func bind() { }
}
