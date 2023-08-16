//
//  SpecialOfferCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class SpecialOfferCollectionViewCell: UICollectionViewCell {
    
    let specialOfferImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .cyan
        contentView.addSubview(specialOfferImageView)
        
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        specialOfferImageView.translatesAutoresizingMaskIntoConstraints = false
        specialOfferImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        specialOfferImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        specialOfferImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        specialOfferImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
