//
//  NumberSwiftUIView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

struct NumberView: View {
  @State private var num = 0
  
  var body: some View {
    HStack {
      ButtonView(type: .numerator, viewLabel: "-") {
        num -= 1
      }
      
      Text(String(num))
        .font(.largeTitle)
        .padding()
      
      
      ButtonView(type: .numerator, viewLabel: "+") {
        num += 1
      }
      
    }
  }
}

#Preview {
    NumberView()
}
