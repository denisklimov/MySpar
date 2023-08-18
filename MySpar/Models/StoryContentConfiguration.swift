//
//  StoryContentConfiguration.swift
//  MySpar
//
//  Created by Denis Klimov on 18.08.2023.
//

import UIKit

struct StoryContentConfiguration: UIContentConfiguration, Hashable {
    
    var image: UIImage?
    var footer: String?
    var isRead: Bool?
    var borderColor: UIColor?
    
    private let isReadColor = UIColor.systemGray4
    private let isNotReadColor = UIColor(named: "AccentGreen")!
    
    func makeContentView() -> UIView & UIContentView {
        return StoryContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> StoryContentConfiguration {
        
        var updatedConfiguration = self
        if let isRead = isRead {
            updatedConfiguration.borderColor = isRead ? isReadColor : isNotReadColor
        }

        return updatedConfiguration
    }
    
}
