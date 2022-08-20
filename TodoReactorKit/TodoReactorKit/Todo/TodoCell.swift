//
//  TodoCell.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class TodoCell: BaseCollectionViewCell {

    private let labelStackView = UIStackView()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let priorityLabel = UILabel()
    
    override func attribute() {
        super.attribute()
        
        setCornerRadius(with: 5)
        backgroundColor = .white
        addShadow(x: 2, y: 2)

        //LabelStackView
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 5        

        //TitleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        //ContentsLabel
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = .boldSystemFont(ofSize: 15)
        
        //PriorityLabel
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    override func layout() {
        super.layout()
        
        addSubview(labelStackView)
        labelStackView.addArrangedSubviews([titleLabel, contentLabel, priorityLabel])

        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    func configure(with data: TodoModel) {
        titleLabel.text = "제목: \(data.title)"
        contentLabel.text = "내용: \(data.content)"
        priorityLabel.text = "중요도: \(data.priority.rawValue)"
    }
}
