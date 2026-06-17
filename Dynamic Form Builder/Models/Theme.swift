//
//  Theme.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

struct Theme: Codable {
    let backgroundColor: String
    let textColor: String
    let borderColor: String
    let errorColor: String

    enum CodingKeys: String, CodingKey {
        case backgroundColor = "background_color"
        case textColor = "text_color"
        case borderColor = "border_color"
        case errorColor = "error_color"
    }
}
