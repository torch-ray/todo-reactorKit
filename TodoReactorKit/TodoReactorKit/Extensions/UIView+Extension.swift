//
//  UIView+Extension.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

    func addShadow(
        color: UIColor = .black, alpha: Float = 0.3, x: CGFloat = 0, y: CGFloat = -2, blur: CGFloat = 2) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur
        layer.masksToBounds = false
    }

    func setCornerRadius(with radius: CGFloat, masksToBounds: Bool = true) {
        layer.masksToBounds = masksToBounds
        layer.cornerRadius = radius
    }
    
    func setBorder(color: UIColor = .black, width: CGFloat = 1) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIStackView {

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
