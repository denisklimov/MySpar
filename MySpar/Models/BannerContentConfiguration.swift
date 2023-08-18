//
//  BannerContentConfiguration.swift
//  MySpar
//
//  Created by Denis Klimov on 18.08.2023.
//

import UIKit

struct BannerContentConfiguration: UIContentConfiguration, Hashable {
    
    var image: UIImage?
    
    func makeContentView() -> UIView & UIContentView {
        return BannerContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> BannerContentConfiguration {
        return self
    }
    
}
