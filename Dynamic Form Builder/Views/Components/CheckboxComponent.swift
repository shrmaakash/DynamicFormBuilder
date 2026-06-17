//
//  CheckBoxCmponent.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import SwiftUI

struct CheckboxComponent: View {

    let field: FormField

    @ObservedObject var viewModel: FormViewModel

    private var checkboxBinding: Binding<Bool> {

        Binding(
            get: {
                viewModel.checkboxValues[field.id] ?? false
            },
            set: {
                viewModel.checkboxValues[field.id] = $0
            }
        )
    }
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                
                Image(
                    systemName:
                        (viewModel.checkboxValues[field.id] ?? false)
                    ? "checkmark.square.fill"
                    : "square"
                )
                .foregroundStyle(Color.white)
                .onTapGesture {
                    checkboxBinding.wrappedValue.toggle()
                }
                
                Text(field.label ?? "")
                    .foregroundColor(
                        Color(
                            hex: viewModel.form?.theme.textColor ?? "#000000"
                        )
                    )            }
            if let error = viewModel.errors[field.id] {
                
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}
