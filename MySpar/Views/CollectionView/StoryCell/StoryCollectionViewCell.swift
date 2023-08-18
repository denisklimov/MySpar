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

//
//var storyImageView = UIImageView()
//var storyFooter = UILabel(frame: .zero)
//var isRead = false {
//    didSet {
//        storyImageView.layer.borderColor = isRead ? isReadColor.cgColor : isNotReadColor?.cgColor
//    }
//}
//
//private let isReadColor = UIColor.systemGray4
//private let isNotReadColor = UIColor(named: "AccentGreen")
//
//override init(frame: CGRect) {
//    super.init(frame: frame)
//
//    storyFooter.font = UIFont.systemFont(ofSize: 12)
//    storyFooter.textAlignment = .center
//    storyFooter.numberOfLines = 2
//
//    storyImageView.clipsToBounds = true
//
//    contentView.addSubview(storyFooter)
//    contentView.addSubview(storyImageView)
//
//    storyImageView.translatesAutoresizingMaskIntoConstraints = false
//    storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
//    storyImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
//    storyImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
//    storyImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
//
//    storyFooter.translatesAutoresizingMaskIntoConstraints = false
//    storyFooter.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 10).isActive = true
//    storyFooter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
//    storyFooter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
//
//    storyImageView.layer.cornerRadius = contentView.bounds.width / 2
//    storyImageView.layer.borderWidth = 2.0
//
//    let borderLayer = CALayer()
//    borderLayer.frame = CGRect(x: 2, y: 2, width: contentView.bounds.width - 4, height: contentView.bounds.width - 4)
//    borderLayer.cornerRadius = (contentView.bounds.width - 4) / 2
//    borderLayer.borderColor = UIColor.white.cgColor
//    borderLayer.borderWidth = 2
//    storyImageView.layer.addSublayer(borderLayer)
//}
//
//required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
