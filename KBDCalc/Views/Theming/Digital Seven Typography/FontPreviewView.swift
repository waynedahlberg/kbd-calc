//
//  FontPreviewView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/6/24.
//

import SwiftUI

struct FontPreviewView: View {
  @State private var fontProperties = FontSelectionProperties()
  @State private var showModal = false
  
  var body: some View {
    VStack {
      VStack(spacing: 16) {
        Text("Sample Text")
        Text("01234567890")
      }
      .font(.custom(fontProperties.selectedFontName(), size: 24))
      .padding()
      
      Button("Choose font") {
        self.showModal = true
      }
      .sheet(isPresented: $showModal) {
        FontChooseModal(fontProperties: $fontProperties)
          .presentationDetents([.medium])
      }
      
      Spacer()
    }
    .padding(.top, 64)
  }
  
  struct FontChooseModal: View {
    @Binding var fontProperties: FontSelectionProperties
    @Environment(\.dismiss) var dismiss

    var body: some View {
      NavigationView {
        Form {
          Picker("Font Weight", selection: $fontProperties.fontWeight) {
            ForEach(FontWeight.allCases) { weight in
              Text(weight.rawValue)
                .tag(weight)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
          Toggle("Italic", isOn: $fontProperties.isItalic)
          
          Toggle("14 Segment", isOn: $fontProperties.isDSEG14)
          
          Toggle("ClassicMini", isOn: $fontProperties.isClassicMini)
          
          Button("Apply Font") {
            
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
}

#Preview {
  FontPreviewView()
}
