//
//  ToggleComponent.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import SwiftUI

import SwiftUI

struct ToggleComponent: View {

    let field: FormField
    
    @ObservedObject var viewModel: FormViewModel

    private var toggleBinding: Binding<Bool> {

        Binding(
            get: {
                viewModel.toggleValues[field.id] ?? false
            },
            set: {
                viewModel.toggleValues[field.id] = $0
            }
        )
    }
    var body: some View {

        Toggle(
            field.label ?? "",
            isOn: toggleBinding
        )
        .foregroundColor(
                    Color(
                        hex: viewModel.form?.theme.textColor ?? "#000000"
                    )
                )
        
    }
}
