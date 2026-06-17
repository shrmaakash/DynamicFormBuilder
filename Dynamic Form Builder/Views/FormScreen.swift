//
//  FormView.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import SwiftUI

struct FormScreen: View {
    
    @StateObject private var viewModel = FormViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {

                if let form = viewModel.form {
                    
                    Text(form.formTitle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(
                            Color(
                                hex: form.theme.textColor
                            )
                        )
                    
                    ForEach(form.visibleFields) { field in
                        
                        DynamicFieldView(
                            field: field,
                            viewModel: viewModel
                        )
                    }
                }
                
                Button("Save") {
                    
                    if viewModel.validate() {

                        let payload = viewModel.buildPayload()

                        if let jsonData = try? JSONSerialization.data(
                            withJSONObject: payload,
                            options: .prettyPrinted
                        ),
                        let jsonString = String(data: jsonData, encoding: .utf8) {

                            print(jsonString)
                        }
                    }
                    else {
                        
                        print(viewModel.errors)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .ignoresSafeArea()
            
        }
        .background(
            Color(
                hex: viewModel.form?.theme.backgroundColor ?? "#FFFFFF"
            )
        )
        .task {
            viewModel.loadForm()
        }
    }
}
