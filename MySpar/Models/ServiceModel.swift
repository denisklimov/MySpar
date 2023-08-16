//
//  ServiceModel.swift
//  MySpar
//
//  Created by Denis Klimov on 14.08.2023.
//

import UIKit
import Foundation

struct ServiceModel: Hashable {
    enum TitleColorMode {
        case dark, light
    }
    let serviceTitle: String
    let titleColorMode: TitleColorMode
    let serviceImage: UIImage
}
