//
//  FieldType.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

enum FieldType: Codable {

    case text
    case dropdown
    case toggle
    case checkbox
    case colorPicker
    case unknown

    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)

        switch value {

        case "TEXT":
            self = .text

        case "DROPDOWN":
            self = .dropdown

        case "TOGGLE":
            self = .toggle

        case "CHECKBOX":
            self = .checkbox

        case "COLOR_PICKER":
            self = .colorPicker

        default:
            self = .unknown
        }
    }
}
