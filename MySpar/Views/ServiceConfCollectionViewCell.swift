//
//  ServiceConfCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 17.08.2023.
//

import UIKit

class ServiceConfCollectionViewCell: UICollectionViewCell {
    
    var item: ServiceModel?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = ServiceContentConfiguration().updated(for: state)
        newConfiguration.title = item?.serviceTitle
        newConfiguration.image = item?.serviceImage
        contentConfiguration = newConfiguration
    }
    
}
