//
//  EditViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class EditViewController: BaseViewController {

    //View
    private let dimView = UIView()
    private let detailView = EditView()
    
    private override init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func attribute() {
        super.attribute()
        
        //Self
        view.backgroundColor = .clear

        //DimView
        dimView.alpha = 0.2
        dimView.backgroundColor = .black
        dimView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layout() {
        super.layout()
        
        view.addSubviews([dimView, detailView])
        
        NSLayoutConstraint.activate([
            //DimView
            dimView.topAnchor.constraint(equalTo: view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //DetailView
            detailView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.widthAnchor.constraint(equalToConstant: 350),
            detailView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    static func build() -> EditViewController {
        let editVC = EditViewController()
        editVC.modalPresentationStyle = .overFullScreen
        return editVC
    }
}
