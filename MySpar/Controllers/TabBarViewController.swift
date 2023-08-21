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

        mainViewController.tabBarItem.title = "Главная"
        mainViewController.tabBarItem.image = UIImage(named: "sparIcon")
        mainViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 7, bottom: 6, right: 7)
        catalogueViewController.tabBarItem.title = "Каталог"
        catalogueViewController.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        cartViewController.tabBarItem.title = "Корзина"
        cartViewController.tabBarItem.image = UIImage(systemName: "cart")
        profileViewController.tabBarItem.title = "Профиль"
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [ mainViewController,
                            catalogueViewController,
                            cartViewController,
                            profileViewController ]
        
        tabBar.backgroundColor = .systemGray5
        tabBar.tintColor = UIColor(named: "AccentGreen")
        
    }
}
