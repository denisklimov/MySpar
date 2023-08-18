//
//  SearchTextField.swift
//  MySpar
//
//  Created by Denis Klimov on 11.08.2023.
//

import UIKit

class SearchTextField: UITextField {
    
    var fontSize = 14.0
    var defaultFrame = CGRect(x: 0, y: 0, width: 200, height: 30)
    var textFieldInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 35)
    var leftViewFrame = CGRect(x: 5, y: 8, width: 25, height: 14)
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return leftViewFrame
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if frame.isEmpty {
            self.frame = defaultFrame
        }
        font = UIFont.systemFont(ofSize: fontSize)
        
        layer.cornerRadius = defaultFrame.height / 2
        layer.borderColor = CGColor(gray: 0.8, alpha: 1.0)
        layer.borderWidth = 1.0
        
        let imageView = UIImageView(image: UIImage(named: "redMapMarker"))
        imageView.contentMode = .scaleAspectFit
        leftView = imageView
        leftViewMode = .always

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
