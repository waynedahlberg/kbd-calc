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
      .foregroundStyle(color(for: fontProperties.fontColor))
      .overlay {
        VStack(spacing: 16) {
          Text("Sample Text")
          Text("01234567890")
        }
        .opacity(fontProperties.glowIntensity * 0.2)
      }
      .glow(color: color(for: fontProperties.fontColor), intensity: fontProperties.glowIntensity)
      .font(.custom(fontProperties.selectedFontName(), size: 24))
      .padding()
      
      Button("Change font") {
        self.showModal = true
      }
      .buttonStyle(.borderedProminent)
      .sheet(isPresented: $showModal) {
        FontChooseModal(fontProperties: $fontProperties)
          .presentationDetents([.medium])
      }
      
      Spacer()
    }
    .padding(.top, 64)
  }
  
  private func color(for fontColor: FontColor) -> Color {
    switch fontColor {
    case .red:
      return .red
    case .green:
      return .green
    case .blue:
      return Color(hex: "##2e97ff")
    }
  }
  
  struct FontChooseModal: View {
    @Binding var fontProperties: FontSelectionProperties
    @Environment(\.dismiss) var dismiss

    var body: some View {
      NavigationView {
        Form {
          Picker("Font Color", selection: $fontProperties.fontColor) {
            ForEach(FontColor.allCases) { color in
              Text(color.rawValue).tag(color)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
          Slider(value: $fontProperties.glowIntensity, in: 0...2, step: 0.1) {
            Text("Glow intensity")
          } minimumValueLabel: {
            Text("0")
          } maximumValueLabel: {
            Text("10")
          }
          .padding()

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
          
          
        }
        .formStyle(.automatic)
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
