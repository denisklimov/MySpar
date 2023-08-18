//
//  DiscountLabelView.swift
//  MySpar
//
//  Created by Denis Klimov on 15.08.2023.
//

import UIKit

class DiscountLabelView: UIView {

    var discount: String? {
        didSet {
            discountLabel.text = discount
        }
    }
    
    private var discountLabel = UILabel()
    
    private func addDiscountLabel() {
        discountLabel.textColor = .red
        discountLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        addSubview(discountLabel)
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0).isActive = true
        discountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2.0).isActive = true
        discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0).isActive = true
        discountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.0).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.7)
        layer.cornerRadius = 7
        clipsToBounds = true
        
        addDiscountLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
