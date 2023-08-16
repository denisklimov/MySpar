//
//  CartViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 11.08.2023.
//

import UIKit

class CartViewController: UIViewController {

    private var header: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header = UILabel()
        header.text = tabBarItem.title
        header.font = UIFont.systemFont(ofSize: 27, weight: .medium)
        view.addSubview(header)
        view.backgroundColor = .systemGray6
        applyContraintsForHeader()
    }
    
    private func applyContraintsForHeader() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        header.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}
