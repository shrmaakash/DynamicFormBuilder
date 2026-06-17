# DynamicFormBuilder

Dynamic Form Builder (Server-Driven UI)
Developer

Akash Sharma

Overview

This project is a SwiftUI-based Dynamic Form Builder that renders UI from a JSON configuration rather than hardcoded screens.

The application parses a server-driven JSON form definition and dynamically generates UI components such as text fields, secure fields, dropdowns, toggles, and checkboxes. User input is stored in a centralized ViewModel and validated according to rules defined in the JSON.

The goal was to build a flexible architecture that can easily support new field types with minimal code changes.

Architecture & Approach

The project follows a lightweight MVVM architecture.

Models
Responsible for decoding and representing JSON data.
FormResponse
FormField
FieldOption
Theme
FieldType
FieldSubtype

ViewModel
FormViewModel

Responsibilities:

Load and decode JSON
Store form values
Store validation errors
Handle validation logic
Build submission payload
Manage default values
Views

The UI is composed of reusable components:
FormScreen
DynamicFieldView
TextFieldComponent
DropdownComponent
ToggleComponent
CheckboxComponent
ColorPickerComponent (extra)

DynamicFieldView acts as a renderer and decides which UI component should be displayed for each field type.


1. Handling Dropdowns with No Options
Some dropdown fields contained an empty options array.

Decision:
Instead of rendering an empty picker, I displayed a "No options available" message.

Why:
This prevents user confusion and clearly communicates that the field has no selectable values rather than appearing broken.


2. Validation Trigger Timing
The requirements specified validation but did not define when it should occur.

Decision:
Validation is performed when the user taps the Save button.

Why:
This avoids showing error messages while users are still typing and provides a cleaner form-filling experience.


3. Maximum Length Enforcement
The JSON provides max_length values for some text fields.

Decision:
Input is restricted as the user types by truncating values beyond the allowed length and displaying a live character counter.

Why:
This prevents invalid input from entering the form state and gives immediate feedback to the user.

What Would I Improve With More Time?
1. Local Persistence(This is the main part which i could include.)
Save form progress locally using UserDefaults or local storage so users can resume incomplete forms.

2. Better Form Submission Flow
Instead of printing the payload to the console, I would implement a mock API submission layer and success/error states.


Challenges & How I Worked Through Them
1. Dynamic Form Rendering
Challenge:
Building a single UI capable of rendering different field types from JSON.

Solution:
I used a FieldType enum and a centralized DynamicFieldView renderer that maps field types to reusable SwiftUI components.


2. Managing State for Different Field Types

Challenge:
Each field type requires different data storage (String, Bool, selected option, etc.).
Solution:
I maintained separate dictionaries in the ViewModel (textValues, toggleValues, checkboxValues, dropdownValues) keyed by field ID for simple and predictable state management.

3. Visibility Rules
Challenge:
Fields needed to appear or disappear based on values selected in other fields.
Solution:
I implemented visibility filtering before rendering so only fields whose conditions are satisfied are displayed to the user.
