//
//  NumberSwiftUIView.swift
//  DataSwiftUI
//
//  Created by CEMRE YARDIM on 24.10.2023.
//

import SwiftUI

struct NumberView: View {
  @State private var num = 0
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      
      HStack {
        Button(action: {
          dismiss()
        }, label: {
          Image(systemName: "arrowshape.backward")
            .padding(.leading, 16)
        })
        
        Spacer()
      }
      
      Spacer()
      
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
      
      Spacer()
    }
    
    
  }
}

#Preview {
    NumberView()
}
