//
//  TextFieldComponent.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import SwiftUI

struct TextFieldComponent: View {

    let field: FormField

    @ObservedObject var viewModel: FormViewModel

    private var textBinding: Binding<String> {

        Binding(
            get: {
                viewModel.textValues[field.id] ?? ""
            },
            set: { newValue in

                if let max = field.maxLength {

                    viewModel.textValues[field.id] =
                        String(newValue.prefix(max))

                } else {

                    viewModel.textValues[field.id] = newValue
                    
                }
            }
        )
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {

            Text(field.label ?? "")
                .foregroundColor(
                    Color(
                        hex: viewModel.form?.theme.textColor ?? "#000000"
                    )
                )

            switch field.subtype {

            case .secure:

                SecureField(
                    field.placeholder ?? "Enter Your Password",
                    text: textBinding
                )
                .foregroundColor(
                    Color(
                        hex: viewModel.form?.theme.textColor ?? "#000000"
                    )
                )
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color(
                                hex: viewModel.form?.theme.borderColor ?? "#D1D5DB"
                            ),
                            lineWidth: 1
                        )
                }

            default:

                TextField(
                    field.placeholder ?? "Enter your text",
                    text: textBinding
                )
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
                .foregroundColor(
                    Color(
                        hex: viewModel.form?.theme.textColor ?? "#000000"
                    )
                )
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color(
                                hex: viewModel.form?.theme.borderColor ?? "#D1D5DB"
                            ),
                            lineWidth: 1
                        )
                }
            }

            if let error = viewModel.errors[field.id] {

                Text(error)
                    .font(.caption)
                    .foregroundColor(
                        Color(
                            hex: viewModel.form?.theme.errorColor ?? "#FF0000"
                        )
                    )
            }

            if let max = field.maxLength {

                HStack {

                    Spacer()

                    Text(
                        "\(textBinding.wrappedValue.count)/\(max)"
                    )
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
        }
    }

    private var keyboardType: UIKeyboardType {

        switch field.subtype {

        case .number:
            return .numberPad

        case .uri:
            return .URL

        default:
            return .default
        }
    }
}
