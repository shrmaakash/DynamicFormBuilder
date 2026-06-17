//
//  DynamicFieldView.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import SwiftUI

struct DynamicFieldView: View {

    let field: FormField

    @ObservedObject var viewModel: FormViewModel

    var body: some View {

        switch field.type {

        case .text:
            TextFieldComponent(
                field: field,
                viewModel: viewModel
            )

        case .dropdown:
            DropdownComponent(
                field: field,
                viewModel: viewModel
            )

        case .toggle:
            ToggleComponent(
                field: field,
                viewModel: viewModel
            )

        case .checkbox:
            CheckboxComponent(
                field: field,
                viewModel: viewModel
            )

        case .colorPicker:
            ColorPickerComponent(
                field: field,
                viewModel: viewModel
            )

        case .unknown:
            EmptyView()
        }
    }
}
