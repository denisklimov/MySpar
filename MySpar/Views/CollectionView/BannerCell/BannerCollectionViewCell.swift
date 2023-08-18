//
//  BannerCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var itemModel: BannerModel?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        
        var newConfiguration = BannerContentConfiguration().updated(for: state)
        newConfiguration.image = itemModel?.image
        contentConfiguration = newConfiguration
    }

}
