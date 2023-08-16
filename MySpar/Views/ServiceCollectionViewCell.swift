//
//  ServiceCollectionViewCell.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    var serviceTitle = UILabel()
//    var serviceTitleMode: ServiceModel.TitleColorMode!
    var serviceImageView = UIImageView()
    
    func setColorForTitle(_ mode: ServiceModel.TitleColorMode) {
        switch mode {
            
        case .dark:
            serviceTitle.textColor = UIColor.white
        case .light:
            serviceTitle.textColor = UIColor.black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        serviceTitle.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        serviceTitle.numberOfLines = 2
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemTeal
        
        serviceImageView.frame = contentView.bounds
        serviceImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(serviceImageView)
        contentView.addSubview(serviceTitle)
        
        serviceTitle.translatesAutoresizingMaskIntoConstraints = false
        serviceTitle.leadingAnchor.constraint(equalTo: serviceImageView.leadingAnchor, constant: 10).isActive = true
        serviceTitle.topAnchor.constraint(equalTo: serviceImageView.topAnchor, constant: 10).isActive = true
        serviceTitle.trailingAnchor.constraint(equalTo: serviceImageView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
