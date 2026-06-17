//
//  FormField.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

struct FormField: Codable, Identifiable {

    let id: String
    let order: Int

    let type: FieldType
    let subtype: TextSubtype?

    let label: String?
    let placeholder: String?

    let required: Bool?
    let errorMessage: String?

    let maxLength: Int?

    let allowMultiple: Bool?

    let options: [Option]?

    let metadata: [String:String]?

    let clickableTextColor: String?

    let defaultValue: DefaultValue?
    
    var defaultValueString: String? {
        defaultValue as? String
    }

    var defaultValueBool: Bool? {
        defaultValue as? Bool
    }
    enum CodingKeys: String, CodingKey {

        case id
        case order
        case type
        case subtype
        case label
        case placeholder
        case required

        case errorMessage = "error_message"
        case maxLength = "max_length"

        case allowMultiple = "allow_multiple"

        case options

        case metadata

        case clickableTextColor = "clickable_text_color"

        case defaultValue = "default_value"
    }
}
