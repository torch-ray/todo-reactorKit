//
//  UICollectionView+Extension.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<T: BaseCollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier \(T.self)")
        }
        return cell
    }
}
