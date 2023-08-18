//
//  BannerContentView.swift
//  MySpar
//
//  Created by Denis Klimov on 18.08.2023.
//

import UIKit

class BannerContentView: UIView, UIContentView {
    
    private var currentConfiguration: BannerContentConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        } set {
            guard let newConfiguration = newValue as? BannerContentConfiguration else { return }
            apply(configuration: newConfiguration)
        }
    }
    
    let imageView = UIImageView()
    
    private func setupViews() {
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
 
        addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func apply(configuration: BannerContentConfiguration) {
        
        guard currentConfiguration != configuration else { return }
        currentConfiguration = configuration
        imageView.image = configuration.image
    }
    
    init(configuration: BannerContentConfiguration) {
        super.init(frame: .zero)
        self.configuration = configuration
        setupViews()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
