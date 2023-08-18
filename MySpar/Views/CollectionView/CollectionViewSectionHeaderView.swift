//
//  CollectionViewSectionHeaderView.swift
//  MySpar
//
//  Created by Denis Klimov on 18.08.2023.
//

import UIKit

class CollectionViewSectionHeaderView: UICollectionReusableView {
    
    static let elementKind = "section-header-element-kind"
    
    var title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        title.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
