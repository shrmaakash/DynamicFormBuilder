//
//  FormViewModel.swift
//  Dynamic Form Builder
//
//  Created by Akash Sharma on 14/06/26.
//

import Foundation
import Combine
import SwiftUI

final class FormViewModel: ObservableObject {

    @Published var form: FormResponse?
    
    @Published var textValues: [String: String] = [:]

    @Published var toggleValues: [String: Bool] = [:]
    
    @Published var checkboxValues: [String: Bool] = [:]

    @Published var dropdownValues: [String: String] = [:]

    @Published var errors: [String: String] = [:]
    
    @Published var colorValues: [String: Color] = [:]
    
    func loadForm() {

        do {

            let loadedForm = try JSONloader.loadForm()
            for field in loadedForm.fields {
                print(field.id, field.type)
            }
            form = loadedForm

            for field in loadedForm.fields {

                // TEXT fields
                if let defaultText = field.defaultValueString {
                    textValues[field.id] = defaultText
                }

                // TOGGLE fields
                if let defaultToggle = field.defaultValueBool {
                    toggleValues[field.id] = defaultToggle
                }
            }

        } catch {
            print(error)
        }
        
    }
    
    func buildPayload() -> [String: Any] {

        var payload: [String: Any] = [:]

        payload.merge(textValues) { _, new in new }
        payload.merge(dropdownValues) { _, new in new }
        payload.merge(toggleValues) { _, new in new }
        payload.merge(checkboxValues) { _, new in new }

        return payload
    }
    
    func validate() -> Bool {

        errors.removeAll()

        guard let form else {
            return false
        }

        for field in form.visibleFields {

            guard field.required ?? false else { continue }

            switch field.type {

            case .text:

                let value = textValues[field.id] ?? ""

                if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {

                    errors[field.id] =
                    field.errorMessage ?? "This field is required."
                }

            case .dropdown:

                if field.options?.isEmpty ?? true {
                    continue
                }

                let value = dropdownValues[field.id] ?? ""

                if value.isEmpty {

                    errors[field.id] =
                    field.errorMessage ?? "Please select an option."
                }

            case .checkbox:

                let checked = checkboxValues[field.id] ?? false

                if !checked {

                    errors[field.id] =
                    field.errorMessage ?? "Please accept before continuing."
                }

            case .toggle:
                break
                
            case .colorPicker:
                break
                
            case .unknown:
                break
            }
        }

        return errors.isEmpty
    }
    
    func saveValues(){
        print(textValues, toggleValues, checkboxValues, dropdownValues)
    }
}

