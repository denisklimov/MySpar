//
//  TabBarViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 11.08.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    private let mainViewController = MainViewController()
    private let catalogueViewController = CatalogueViewController()
    private let cartViewController = CartViewController()
    private let profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainViewController.tabBarItem.title = "Main"
        mainViewController.tabBarItem.image = UIImage(systemName: "tree.circle")
        catalogueViewController.tabBarItem.title = "Catalogue"
        catalogueViewController.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        cartViewController.tabBarItem.title = "Cart"
        cartViewController.tabBarItem.image = UIImage(systemName: "cart")
        profileViewController.tabBarItem.title = "Profile"
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [ mainViewController,
                            catalogueViewController,
                            cartViewController,
                            profileViewController ]
        
        tabBar.backgroundColor = .systemGray5
        tabBar.tintColor = UIColor(named: "AccentGreen")
        
    }
    
}
