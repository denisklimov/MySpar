//
//  StoryModel.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit

struct StoryModel: Hashable {
    
    let id = UUID()
    
    let image: UIImage
    let footer: String
    let isRead: Bool
}
