//
//  ProductCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var item: ProductModel?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = ProductContentConfiguration().updated(for: state)
        newConfiguration.accentLabel = item?.accentLabel
        newConfiguration.accentLabelColor = item?.accentLabelColor
        newConfiguration.productImage = item?.productImage
        newConfiguration.actualPrice = item?.actualPrice
        newConfiguration.oldPrice = item?.oldPrice
        newConfiguration.discount = item?.discount
        
        contentConfiguration = newConfiguration
    }

}

