//
//  BonusStatusCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class BonusStatusCollectionViewCell: UICollectionViewCell {
    
    var bonusStatus = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImageView = UIImageView(image: UIImage(named: "bonusBackground.png"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = contentView.bounds
        contentView.addSubview(backgroundImageView)
        
        bonusStatus.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        bonusStatus.textColor = .black.withAlphaComponent(0.9)
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true

        
        contentView.addSubview(bonusStatus)
        bonusStatus.translatesAutoresizingMaskIntoConstraints = false
        bonusStatus.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        bonusStatus.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
