//
//  ContentView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
  @State private var name = ""
  @State private var surname = ""
  @State private var isShowingPopover = false
  @State private var isNumberButtonPressed: Bool = false
  @State private var isLetterButtonPressed: Bool? = false
  var isButtonPressedBinding: Binding<Bool> {
    Binding(
      get: {
        self.isLetterButtonPressed ?? false
      },
      set: { newValue in
        self.isLetterButtonPressed = newValue
      }
    )
  }
  var isValid: Bool {
    return !name.isEmpty && !surname.isEmpty
  }
  
  @FocusState private var focusField: Field?
  enum Field: Hashable {
    case name
    case surname
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("Please enter your name and surname")
          .foregroundStyle(isValid ? .black : .red)
        
        TextField("Enter your name", text: $name)
          .popover(isPresented: $isShowingPopover) {
            Text("hello \(name)")
              .presentationCompactAdaptation(.popover)
              .padding()
          }
          .multilineTextAlignment(.center)
          .padding(.horizontal, 64)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled()
          .border(.secondary).cornerRadius(3)
          .onTapGesture {
            isShowingPopover.toggle()
          }
          .focused($focusField, equals: .name)
          .onAppear {
            focusField = .name
          }
        
        TextField("Enter your surname", text: $surname)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 64)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled()
          .border(.secondary).cornerRadius(3)
          .focused($focusField, equals: .surname)
        
        
        ButtonView(type: .numerator, viewLabel: "number view") {
          if name.isEmpty {
            focusField = .name
          } else if surname.isEmpty {
            focusField = .surname
          } else {
            isNumberButtonPressed.toggle()
          }
        }
        .padding()
        
        NavigationLink("", destination: NumberView().navigationBarBackButtonHidden(),
                       isActive: $isNumberButtonPressed)
        
        ButtonView(type: .navigator, bindingBool: $isLetterButtonPressed, viewLabel: "letter view")
          .sheet(isPresented: isButtonPressedBinding, content: {
            LetterView()
          })
          .padding()
          .disabled(!isValid)
      }
    }
  }
}

#Preview {
  ContentView()
}
