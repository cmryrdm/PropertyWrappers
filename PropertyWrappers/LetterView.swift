//
//  LetterSwiftUIView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

struct LetterView: View {
  @State private var isButtonPressed : Bool? = false
  
  var body: some View {
    VStack {
      Text("changing color")
        .font(.largeTitle)
        .foregroundStyle(isButtonPressed ?? false ? .green : .red)
        .padding()
      
      ButtonView(type: .navigator, bindingBool: $isButtonPressed, viewLabel: "Apply")
      
      
    }
  }
}

#Preview {
  LetterView()
}
