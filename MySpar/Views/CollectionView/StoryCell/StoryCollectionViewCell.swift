//
//  StoryCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    var itemModel: StoryModel?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = StoryContentConfiguration().updated(for: state)
        newConfiguration.image = itemModel?.image
        newConfiguration.footer = itemModel?.footer
        newConfiguration.isRead = itemModel?.isRead
        contentConfiguration = newConfiguration
    }
}
