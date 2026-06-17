import SwiftUI

struct DropdownComponent: View {
    
    let field: FormField
    
    @ObservedObject var viewModel: FormViewModel
    
    private var dropdownBinding: Binding<String> {
        
        Binding(
            get: {
                viewModel.dropdownValues[field.id] ?? ""
            },
            set: {
                viewModel.dropdownValues[field.id] = $0
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
            
            if field.options?.isEmpty ?? true {
                
                Text("No options available")
                    .foregroundColor(.secondary)
                
            } else {
                
                Picker("Select", selection: dropdownBinding) {
                    
                    ForEach(field.options ?? []) { option in
                        
                        Text(option.label)
                            .tag(option.id)
                    }
                }
                .pickerStyle(.menu)
                
                if let error = viewModel.errors[field.id] {
                    
                    Text(error)
                        .font(.caption)
                        .foregroundColor(
                            Color(
                                hex: viewModel.form?.theme.errorColor ?? "#FF0000"
                            )
                        )
                }
            }
        }
    }
}
