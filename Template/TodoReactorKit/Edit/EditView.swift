//
//  EditView.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

protocol EditDelegate: AnyObject {
    func updateUI(_ data: TodoModel)
}

final class EditView: BaseView, EditDelegate {

    //View
    private let titleLabel = UILabel()
    private let middleButtonStackView = UIStackView()
    private let priorityButton = UIButton(type: .system)
    private let statusButton = UIButton(type: .system)
    private let contentTextView = UITextView()
    private let bottomButtonStackView = UIStackView()
    private let confirmButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)

    //ViewModel
    private let viewModel = EditViewModel()

    override func attribute() {
        super.attribute()
        
        //Self
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        setCornerRadius(with: 5)
        
        //TitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 25)
        
        //MiddleLabelStackView
        middleButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        middleButtonStackView.distribution = .fillEqually
        middleButtonStackView.spacing = 5
        
        //PriorityButton
        priorityButton.translatesAutoresizingMaskIntoConstraints = false
        priorityButton.setTitleColor(.black, for: .normal)
        priorityButton.setCornerRadius(with: 5)
        priorityButton.setBorder()
        setupPriorityButtonAction()
        
        //StatusButton
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitleColor(.black, for: .normal)
        statusButton.setCornerRadius(with: 5)
        statusButton.setBorder()
        setupStatusButtonAction()

        //ContentTextView
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        //BottomButtonStackView
        bottomButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonStackView.distribution = .fillEqually
        bottomButtonStackView.spacing = 5
        
        //ConfirmButton
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(.blue, for: .normal)
        confirmButton.setCornerRadius(with: 5)
        confirmButton.setBorder()
        
        //CancelButton
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.setCornerRadius(with: 5)
        cancelButton.setBorder()
    }
    
    override func layout() {
        super.layout()
        
        addSubviews([titleLabel, middleButtonStackView, contentTextView, bottomButtonStackView])
        middleButtonStackView.addArrangedSubviews([priorityButton, statusButton])
        bottomButtonStackView.addArrangedSubviews([confirmButton, cancelButton])
        
        NSLayoutConstraint.activate([
            //TitleLabel
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //MiddleLabelStackView
            middleButtonStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            middleButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            middleButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            middleButtonStackView.heightAnchor.constraint(equalToConstant: 30),
            
            //ContentTextView
            contentTextView.topAnchor.constraint(equalTo: middleButtonStackView.bottomAnchor, constant: 10),
            contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            contentTextView.heightAnchor.constraint(equalToConstant: 150),
            
            //
            bottomButtonStackView.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 10),
            bottomButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bottomButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bottomButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    override func bind() {
        super.bind()
        viewModel.delegate = self
        confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    func configure(with data: TodoModel) {
        viewModel.configure(data)
    }

    func updateUI(_ data: TodoModel) {
        titleLabel.text = data.title
        priorityButton.setTitle(data.priority.rawValue, for: .normal)
        statusButton.setTitle(data.status.rawValue, for: .normal)
        contentTextView.text = data.content
    }
}

//MARK: SetupButtonAction
private extension EditView {
    
    func setupPriorityButtonAction() {
        priorityButton.showsMenuAsPrimaryAction = true
        priorityButton.changesSelectionAsPrimaryAction = true
        let high  = UIAction(title: "HIGH", handler: { _ in })
        let medium = UIAction(title: "MEDIEUM", handler: { _ in })
        let low  = UIAction(title: "LOW", handler: { _ in })
        let buttonMenu = UIMenu(title: "Priority", children: [high, medium, low])
        priorityButton.menu = buttonMenu
    }

    func setupStatusButtonAction() {
        statusButton.showsMenuAsPrimaryAction = true
        statusButton.changesSelectionAsPrimaryAction = true
        let todo  = UIAction(title: "TODO", handler: { _ in })
        let progress  = UIAction(title: "PROGRESS", handler: { _ in })
        let done  = UIAction(title: "DONE", handler: { _ in })
        let buttonMenu = UIMenu(title: "Status", children: [todo, progress, done])
        statusButton.menu = buttonMenu
    }

    @objc
    func didTapConfirmButton() {
        let title = titleLabel.text ?? ""
        let content = contentTextView.text ?? ""
        let priority = TodoModel.Priority(rawValue: priorityButton.menu?.selectedElements.first?.title ?? "") ?? TodoModel.Priority.medium
        let status = TodoModel.Status(rawValue: statusButton.menu?.selectedElements.first?.title ?? "") ?? TodoModel.Status.todo
        viewModel.configure(.init(title: title, content: content, priority: priority, status: status))
    }
    
    @objc
    func didTapCancelButton() {
    }
}
