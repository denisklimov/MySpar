//
//  ProductContentConfiguration.swift
//  MySpar
//
//  Created by Denis Klimov on 17.08.2023.
//

import UIKit

struct ProductContentConfiguration: UIContentConfiguration, Hashable {
    
    var accentLabel: String?
    var accentLabelColor: UIColor?
    var accentLabelViewIsHidden: Bool?
    var productImage: UIImage?
    var actualPrice: Double?
    var oldPrice: Double?
    var oldPriceString: NSAttributedString?
    var oldPriceIsHidden: Bool?
    var discount: String?
    var discountIsHidden: Bool?
    
    func makeContentView() -> UIView & UIContentView {
        return ProductContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> ProductContentConfiguration {
        
        var updatedConfiguration = self
        
        updatedConfiguration.accentLabelViewIsHidden = accentLabel != nil ? false : true
        
        if let oldPrice = oldPrice {
            updatedConfiguration.oldPriceString = NSAttributedString(string: String(describing: oldPrice), attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            updatedConfiguration.oldPriceIsHidden = false
        } else {
            updatedConfiguration.oldPriceIsHidden = true
        }
        
        if let _ = discount {
            updatedConfiguration.discountIsHidden = false
        } else {
            updatedConfiguration.discountIsHidden = true
        }
        
        return updatedConfiguration
    }
    
}

