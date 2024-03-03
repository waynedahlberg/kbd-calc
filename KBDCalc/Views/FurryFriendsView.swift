//
//  FurryFriendsView.swift
//  KBDCalc
//
//  Created by Wayne Dahlberg on 3/2/24.
//

import SwiftUI

struct FurryFriendsView: View {
  @State private var pets: [Pet] = Pet.exampleData
  
  var body: some View {
    VStack {
      Grid(alignment: .leading) {
        ForEach(pets) { pet in
          GridRow {
            Text(pet.type)
            ProgressView(value: Double(pet.votes), total: Double(totalVotes()))
            Text("\(pet.votes)")
              .gridColumnAlignment(.trailing)
          }
          Divider()
        }
      }
      
      EqualWidthHStack {
        ForEach($pets) { $pet in
          Button {
            pet.votes += 1
          } label: {
            Text(pet.type)
              .frame(maxWidth: .infinity)
          }
          .buttonStyle(.borderedProminent)
          .tint(.green)
        }
      }
    }
  }
  
  func totalVotes() -> Int {
    return pets.reduce(0) { $0 + $1.votes }
  }
}

#Preview {
  FurryFriendsView()
}

// Data model
struct Pet: Identifiable, Equatable {
  let type: String
  var votes: Int = 0
  var id: String { type }
  
  static var exampleData: [Pet] = [
    Pet(type: "Cat", votes: 25),
    Pet(type: "Goldfish", votes: 9),
    Pet(type: "Dog", votes: 16)
  ]
}


struct EqualWidthHStack: Layout {
  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Void
  ) -> CGSize {
    guard !subviews.isEmpty else { return .zero }
    
    let maxSize = maxSize(subviews: subviews)
    let spacing = spacing(subviews: subviews)
    let totalSpacing = spacing.reduce(0) { $0 + $1 }
    
    return CGSize(
      width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
      height: maxSize.height)
  }
  
  private func maxSize(subviews: Subviews) -> CGSize {
    let subviewSize = subviews.map { $0.sizeThatFits(.unspecified) }
    let maxSize: CGSize = subviewSize.reduce(.zero) { currentMax, subviewSize in
      CGSize(
        width: max(currentMax.width, subviewSize.width),
        height: max(currentMax.height, subviewSize.height))
    }
    
    return maxSize
  }
  
  private func spacing(subviews: Subviews) -> [CGFloat] {
    subviews.indices.map { index in
      guard index < subviews.count - 1 else { return 0 }
      return subviews[index].spacing.distance(to: subviews[index + 1].spacing, along: .horizontal)
    }
  }
  
  func placeSubviews(in bounds: CGRect,
                     proposal: ProposedViewSize,
                     subviews: Subviews,
                     cache: inout ()) {
    // place child views
    guard !subviews.isEmpty else { return }
    
    let maxSize = maxSize(subviews: subviews)
    let spacing = spacing(subviews: subviews)
    
    let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
    var x = bounds.minX + maxSize.width / 2
    
    for index in subviews.indices {
      subviews[index].place(at: CGPoint(x: x, y: bounds.midY), anchor: .center, proposal: placementProposal)
      x += maxSize.width + spacing[index]
    }
  }
}
