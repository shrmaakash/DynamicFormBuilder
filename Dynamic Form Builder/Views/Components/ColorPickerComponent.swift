//
//  ColorPickerComponent.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 16/06/26.
//

import SwiftUI

struct ColorPickerComponent: View {

    let field: FormField

    @ObservedObject var viewModel: FormViewModel

    private var colorBinding: Binding<Color> {

        Binding(
            get: {
                viewModel.colorValues[field.id] ?? .blue
            },
            set: {
                viewModel.colorValues[field.id] = $0
            }
        )
    }

    var body: some View {
        
        HStack {

            Text(field.label ?? "Choose Color")
                .foregroundColor(.white)

            Spacer()

            ColorPicker(
                "",
                selection: colorBinding
            )
            .labelsHidden()
        }
    }
}
