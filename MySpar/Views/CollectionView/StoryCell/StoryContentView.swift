//
//  StoryContentView.swift
//  MySpar
//
//  Created by Denis Klimov on 18.08.2023.
//

import UIKit

class StoryContentView: UIView, UIContentView {
    
    private var currentConfiguration: StoryContentConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        } set {
            guard let newConfiguration = newValue as? StoryContentConfiguration else { return }
            apply(configuration: newConfiguration)
        }
    }
    
    
    let imageView = UIImageView()
    let footer = UILabel()
    
    override func layoutSubviews() {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 2, y: 2, width: bounds.width - 4, height: bounds.width - 4)
        borderLayer.cornerRadius = (bounds.width - 4) / 2
        borderLayer.borderColor = UIColor.white.cgColor
        borderLayer.borderWidth = 2
        imageView.layer.addSublayer(borderLayer)
        imageView.layer.cornerRadius = bounds.width / 2
    }
    
    
    private func setupViews() {
        
        footer.font = UIFont.systemFont(ofSize: 12)
        footer.textAlignment = .center
        footer.numberOfLines = 2
        
        imageView.clipsToBounds = true
 
        addSubview(footer)
        addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true

        
        imageView.layer.borderWidth = 2.0

        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
    }
    
    
    
    private func apply(configuration: StoryContentConfiguration) {
        
        guard currentConfiguration != configuration else { return }
        currentConfiguration = configuration
        imageView.image = configuration.image
        footer.text = configuration.footer
        imageView.layer.borderColor = configuration.borderColor?.cgColor
    }
    
    
    
    init(configuration: StoryContentConfiguration) {
        super.init(frame: .zero)
        self.configuration = configuration
        setupViews()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
