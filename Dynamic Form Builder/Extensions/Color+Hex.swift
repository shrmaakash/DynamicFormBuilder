//
//  Color+Hex.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 15/06/26.
//

import SwiftUI

extension Color {

    init(hex: String) {

        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        var int: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64

        switch hex.count {

        case 6:
            (r, g, b) = (
                (int >> 16) & 0xff,
                (int >> 8) & 0xff,
                int & 0xff
            )

        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}
