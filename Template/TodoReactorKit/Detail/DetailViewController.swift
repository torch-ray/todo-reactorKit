//
//  DetailViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class DetailViewController: BaseViewController {

    override func attribute() {
        super.attribute()
        //Self
        let editButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(didTapEditButton))
        navigationItem.rightBarButtonItem = editButton
        
    }

    func configure(_ data: TodoModel) {
    }
}

//MARK: Action
private extension DetailViewController {

    @objc
    func didTapEditButton() {
        let editVC = EditViewController.build()
        present(editVC, animated: true)
    }
}
