//
//  ButtonView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

enum ButtonType {
  case navigator
  case numerator
}

struct ButtonView: View {
  @Binding var bindingBool : Bool?
  let viewLabel : String
  let type: ButtonType
  let action: (() -> ())?
  
  init(type: ButtonType, bindingBool: Binding<Bool?> = .constant(nil), viewLabel: String) {
    self._bindingBool = bindingBool
    self.viewLabel = viewLabel
    self.type = type
    self.action = nil
  }
  
  init(type: ButtonType, viewLabel: String, action: @escaping () -> Void) {
    self._bindingBool = .constant(nil)
    self.viewLabel = viewLabel
    self.type = type
    self.action = action
  }
  
  
  var body: some View {
    switch type {
      
    case .navigator:
      Button(action: {
        bindingBool?.toggle()
      }, label: {
        Text(viewLabel)
      })
      
    case .numerator:
      Button(action: {
        (action!)()
      }, label: {
        Text(viewLabel)
          .font(.title)
          .foregroundStyle(.black)
      })
      
    }
  }
}

//#Preview {
//  ButtonView()
//}
