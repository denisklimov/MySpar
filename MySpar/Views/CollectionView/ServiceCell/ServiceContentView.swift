//
//  ServiceContentView.swift
//  MySpar
//
//  Created by Denis Klimov on 16.08.2023.
//

import UIKit

class ServiceContentView: UIView, UIContentView {
    
    private var currentConfiguration: ServiceContentConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        } set {
            guard let newConfiguration = newValue as? ServiceContentConfiguration else { return }
            apply(configuration: newConfiguration)
        }
    }
    
    let title = UILabel()
    let imageView = UIImageView()
    
    private func setupViews() {
        
        title.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
        addSubview(title)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10.0).isActive = true
        title.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5.0).isActive = true
        title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    private func apply(configuration: ServiceContentConfiguration) {
        
        guard currentConfiguration != configuration else { return }
        currentConfiguration = configuration
        
        title.text = configuration.title
        title.textColor = configuration.titleColor
        imageView.image = configuration.image
    }
    
    init(configuration: ServiceContentConfiguration) {
        super.init(frame: .zero)
        self.configuration = configuration
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        setupViews()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
