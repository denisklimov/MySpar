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
    var productImage: UIImage?
    var actualPrice: Double?
    var oldPrice: Double?
    var discount: String?
    
    func makeContentView() -> UIView & UIContentView {
        return ProductContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> ProductContentConfiguration {
        
        var updatedConfiguration = self
        
        
        return updatedConfiguration
    }
    
}

