//
//  ServiceContentConfiguration.swift
//  MySpar
//
//  Created by Denis Klimov on 16.08.2023.
//

import UIKit

struct ServiceContentConfiguration: UIContentConfiguration, Hashable {
    
    var title: String?
    var titleColor: UIColor?
    var image: UIImage?
    
    func makeContentView() -> UIView & UIContentView {
        return ServiceContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> ServiceContentConfiguration {
        
        return self
    }
}
