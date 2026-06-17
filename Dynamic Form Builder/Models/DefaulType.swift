//
//  DefaulType.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation

enum DefaultValue: Codable {

    case string(String)
    case bool(Bool)

    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()

        if let string = try? container.decode(String.self) {
            self = .string(string)
            return
        }

        if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
            return
        }

        throw DecodingError.typeMismatch(
            DefaultValue.self,
            .init(
                codingPath: decoder.codingPath,
                debugDescription: "Unsupported default value"
            )
        )
    }
}
