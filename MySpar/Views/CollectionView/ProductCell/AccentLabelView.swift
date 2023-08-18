//
//  AccentLabelView.swift
//  MySpar
//
//  Created by Denis Klimov on 15.08.2023.
//

import UIKit

class AccentLabelView: UIView {

    var label: String? {
        didSet {
            accentLabel.text = label
        }
    }
    var background: UIColor? {
        didSet {
            if let background = background {
                
                    backgroundColor = background.withAlphaComponent(0.6)
               
            } else {
                
                    backgroundColor = .red.withAlphaComponent(0.6)
                
            }
        }
    }
    
    private var accentLabel = UILabel()
    
    private func addAccentLabel() {
        accentLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        accentLabel.textColor = .white
        addSubview(accentLabel)
        accentLabel.translatesAutoresizingMaskIntoConstraints = false
        accentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        accentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        accentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        accentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 7
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        addAccentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
