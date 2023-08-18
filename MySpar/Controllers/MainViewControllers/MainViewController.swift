//
//  MainViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 11.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let searchBarViewController = SearchBarForMainViewController()
    let collectionViewController = CollectionForMainViewController(collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {

        view.backgroundColor = .white
        
        addChildViewController(searchBarViewController, to: view)
        addChildViewController(collectionViewController, to: view)

        applyConstraints()
        
    }
    
    func applyConstraints() {
        searchBarViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBarViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchBarViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchBarViewController.view.bottomAnchor.constraint(equalTo: collectionViewController.view.topAnchor, constant: 0).isActive = true
        
        collectionViewController.view.topAnchor.constraint(equalTo: searchBarViewController.view.bottomAnchor, constant: 0).isActive = true
        collectionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}


extension MainViewController {
    
    func addChildViewController(_ childViewController: UIViewController, to view: UIView) {
        addChild(childViewController)
        childViewController.view.frame = view.bounds
        view.addSubview(childViewController.view)
        childViewController.willMove(toParent: self)
    }
    
}
