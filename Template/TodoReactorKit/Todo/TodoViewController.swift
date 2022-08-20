//
//  TodoViewController.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import UIKit

final class TodoViewController: BaseViewController {

    //View
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var  collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    private let addTodoButton = UIButton(type: .system)

    override func setupTabBarItem() {
        super.setupTabBarItem()
        let tabBarItem = UITabBarItem(title: "Todo", image: UIImage(systemName: "square.and.pencil"), selectedImage: UIImage(systemName: "square.and.pencil"))
        self.tabBarItem = tabBarItem
    }
    
    override func attribute() {
        super.attribute()

        //Self
        navigationItem.title = "TODO"

        //AddTodoButton
        addTodoButton.translatesAutoresizingMaskIntoConstraints = false
        addTodoButton.setTitle("Add", for: .normal)
        addTodoButton.setTitleColor(.black, for: .normal)
        addTodoButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        addTodoButton.setCornerRadius(with: 5)
        addTodoButton.backgroundColor = .white
        addTodoButton.addShadow(x: 2, y: 2)

        //CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TodoCell.self, forCellWithReuseIdentifier: TodoCell.identifier)
        collectionViewFlowLayout.scrollDirection = .vertical
    }
    
    override func layout() {
        super.layout()
        let safeArea = view.safeAreaLayoutGuide
        view.addSubviews([addTodoButton, collectionView])

        NSLayoutConstraint.activate([
            //AddTodoButton
            addTodoButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            addTodoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            addTodoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            addTodoButton.heightAnchor.constraint(equalToConstant: 50),

            //CollectionView
            collectionView.topAnchor.constraint(equalTo: addTodoButton.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func bind() {
        super.bind()
        
        addTodoButton.addTarget(self, action: #selector(didTapAddTodoButton), for: .touchUpInside)
    }
}

//MARK: CollectionView DataSource
extension TodoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TodoCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: .init(title: "asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf", content: "asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf", priority: .high, status: .todo))
        return cell
    }
}

//MARK: CollectionView Delegate
extension TodoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.configure(TodoModel(title: "123", content: "123", priority: .medium, status: .todo))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension TodoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 100)
    }
}


//MARK: Action
private extension TodoViewController {
    
    @objc
    func didTapAddTodoButton() {
    }
}
