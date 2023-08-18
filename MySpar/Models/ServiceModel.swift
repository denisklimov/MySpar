//
//  ServiceModel.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit

struct ServiceModel: Hashable {
    
    var id = UUID()
    
    let title: String
    let titleColor: UIColor
    let image: UIImage
}
