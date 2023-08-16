//
//  SearchBarForMainViewController.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

class SearchBarForMainViewController: UIViewController {
    
    let searchTextField = SearchTextField()
    let menuButton = UIButton()
    var bottomBorder: CALayer!
    
    override func viewDidLayoutSubviews() {
        bottomBorder.frame = CGRect(x: 0, y: view.bounds.height - 1, width: view.bounds.width, height: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.text = "Moscow"
        
        bottomBorder = view.addBottomBorder(UIColor.systemGray5)
        menuButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        menuButton.tintColor = UIColor(named: "AccentGreen")
        menuButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(scale: .large), forImageIn: .normal)
        
        view.addSubview(searchTextField)
        view.addSubview(menuButton)
        
        applyContraints()

    }
    
    private func applyContraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        menuButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10).isActive = true
        menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        view.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        
    }

}


extension UIView {
    
    func addBottomBorder(_ color: UIColor) -> CALayer {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = color.cgColor
        borderLayer.frame = .zero
        self.layer.addSublayer(borderLayer)
        return borderLayer
    }

}
