//
//  DigitalSevenView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

struct DigitalSevenView: View {
  @State private var selectedFont: DigitalSevenFont = .classicRegular
  @State private var showModal = false
  
  var body: some View {
    VStack {
      VStack(spacing: 24) {
        Text("Sample Text")
        Text("0123456789")
      }
      .font(selectedFont.font(size: 24))
      .padding(.top, 64)
      .padding()
      
      Button("Choose font:") {
        self.showModal.toggle()
      }
      .buttonStyle(.borderedProminent)
      .sheet(isPresented: $showModal) {
        FontPickerModal(selectedFont: $selectedFont)
          .presentationDetents([.medium])
      }
      
      Spacer()
    }
  }
}

#Preview {
  DigitalSevenView()
}


// Font picker modal view

struct FontPickerModal: View {
  @Binding var selectedFont: DigitalSevenFont
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      List(DigitalSevenFont.allCases, id: \.self) { font in
        Button(action: {
          self.selectedFont = font
        }) {
          HStack {
            Text(font.rawValue)
              .font(.system(size: 18))
            Spacer()
            Text("123.4")
              .font(font.font(size: 16))
              .foregroundStyle(.gray)
          }
        }
      }
      .navigationTitle(Text("Select Font"))
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") {
            dismiss()
          }
        }
      }
    }
  }
}
