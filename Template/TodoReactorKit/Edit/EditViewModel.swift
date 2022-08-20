//
//  EditViewModel.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import Foundation

final class EditViewModel {

    weak var delegate: EditDelegate?

    var todoModel: TodoModel = TodoModel(title: "", content: "", priority: .medium, status: .todo) {
        didSet {
            delegate?.updateUI(todoModel)
        }
    }

    func configure(_ data: TodoModel) {
        todoModel = data
    }
}
