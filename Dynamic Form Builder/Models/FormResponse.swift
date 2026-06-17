//
//  FormResponse.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

struct FormResponse: Codable {
    let theme: Theme
    let formTitle: String
    let fields: [FormField]

    enum CodingKeys: String, CodingKey {
        case theme
        case fields
        case formTitle = "form_title"
    }
}


extension FormResponse {
    
    var visibleFields: [FormField] {
            fields
                .filter { $0.type != .unknown }
                .sorted { $0.order < $1.order }
        }
}
