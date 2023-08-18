//
//  ProductModel.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit
import Foundation

struct ProductModel: Hashable {
    
    let id = UUID()
    
    var accentLabel: String?
    var accentLabelColor: UIColor?
    var productImage: UIImage
    var actualPrice: Double
    var oldPrice: Double?
    var discount: String?
    
}
