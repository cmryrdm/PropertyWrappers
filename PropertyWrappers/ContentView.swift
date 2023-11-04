//
//  ContentView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
  @State private var name = ""
  @State private var isShowingPopover = false
  @State private var isButtonPressed : Bool? = false
  var isButtonPressedBinding: Binding<Bool> {
    Binding(
      get: {
        self.isButtonPressed ?? false
      },
      set: { newValue in
        self.isButtonPressed = newValue
      }
    )
  }
  
  //@FocusState private var nameIsFocused: Bool
  
  var body: some View {
    NavigationView {
      VStack {
        //        Text(name)
        //          .font(.largeTitle)
        //          .padding()
        
        TextField("Enter your name", text: $name)
          .popover(isPresented: $isShowingPopover) {
            Text("hello \(name)")
              .presentationCompactAdaptation(.popover)
              .padding()
          }
          .multilineTextAlignment(.center)
        //.focused($nameIsFocused)
          .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .center)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled()
          .border(.secondary).cornerRadius(3)
          .onTapGesture {
            isShowingPopover.toggle()
          }
        
        
        NavigationLink {
          NumberView()
        } label: {
          Text("number view")
        }.padding()
        
        ButtonView(type: .navigator, bindingBool: $isButtonPressed, viewLabel: "letter view")
          .sheet(isPresented: isButtonPressedBinding, content: {
            LetterView()
          })
          .padding()
        
        
        
      }
    }
    
  }
}

#Preview {
  ContentView()
}
