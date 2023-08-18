//
//  ProductContentView.swift
//  MySpar
//
//  Created by Denis Klimov on 17.08.2023.
//

import UIKit

class ProductContentView: UIView, UIContentView {
    
    private var currentConfiguration: ProductContentConfiguration!
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        } set {
            guard let newConfiguration = newValue as? ProductContentConfiguration else { return }
            apply(configuration: newConfiguration)
        }
    }
    
    let accentLabelView = AccentLabelView()
    let productImageView = UIImageView()
    let actualPriceLabel = UILabel()
    let oldPriceLabel = UILabel()
    let buyButton = UIButton()
    let discountLabelView = DiscountLabelView()
    
    private func setupViews() {
        
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        
        addSubview(accentLabelView)
        accentLabelView.translatesAutoresizingMaskIntoConstraints = false
        accentLabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        accentLabelView.topAnchor.constraint(equalTo: topAnchor).isActive = true

        buyButton.setImage(UIImage(systemName: "cart"), for: .normal)
        buyButton.backgroundColor = UIColor(named: "AccentGreen")
        buyButton.tintColor = .white
        buyButton.setPreferredSymbolConfiguration(.init(scale: .small), forImageIn: .normal)
        buyButton.layer.cornerRadius = 15.0
        buyButton.clipsToBounds = true
        addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5.0).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        let heightAnchorBuyButton = buyButton.heightAnchor.constraint(equalTo: buyButton.widthAnchor, multiplier: 1.0)
        heightAnchorBuyButton.priority = .init(rawValue: 999)
        heightAnchorBuyButton.isActive = true
        

        actualPriceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        addSubview(actualPriceLabel)
        actualPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        actualPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        actualPriceLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -5).isActive = true
        let centerYAnchorActualPriceLabel = actualPriceLabel.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor)
        centerYAnchorActualPriceLabel.priority = .init(rawValue: 500)
        centerYAnchorActualPriceLabel.isActive = true
        
        oldPriceLabel.textColor = UIColor.systemGray2
        oldPriceLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        addSubview(oldPriceLabel)
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.leadingAnchor.constraint(equalTo: actualPriceLabel.leadingAnchor).isActive = true
        oldPriceLabel.topAnchor.constraint(equalTo: actualPriceLabel.bottomAnchor, constant: 2).isActive = true
        oldPriceLabel.trailingAnchor.constraint(equalTo: actualPriceLabel.trailingAnchor).isActive = true
        oldPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    
        
        addSubview(discountLabelView)
        discountLabelView.translatesAutoresizingMaskIntoConstraints = false
        discountLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0).isActive = true
        discountLabelView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor).isActive = true
        
        
    }
    
    private func apply(configuration: ProductContentConfiguration) {
        
        guard currentConfiguration != configuration else { return }
        currentConfiguration = configuration
        
        productImageView.image = configuration.productImage
        
        actualPriceLabel.text = "\(String(describing: configuration.actualPrice!)) ₽/шт"
        
        accentLabelView.label = configuration.accentLabel
        accentLabelView.background = configuration.accentLabelColor
        
        oldPriceLabel.text = configuration.oldPrice?.description
        
        discountLabelView.discount = configuration.discount
        
    }
    
    init(configuration: ProductContentConfiguration) {
        
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
