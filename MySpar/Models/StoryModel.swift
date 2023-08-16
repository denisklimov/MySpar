//
//  StoryModel.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit
import Foundation

struct StoryModel: Hashable, Identifiable {
    let id = UUID()
    var image: UIImage
    var headerText: String
    var isRead: Bool
}
