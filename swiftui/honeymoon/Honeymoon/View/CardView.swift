//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CardView: View, Identifiable {
  // MARK: - PROPERTY
  
  let id = UUID()
  var honeymoon: Destination
  
  // MARK: - BODY
  
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .scaledToFit()
      .clipShape(RoundedRectangle(cornerRadius: 25))
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(alignment: .bottom) {
        VStack(alignment: .center, spacing: 12) {
          Text(honeymoon.place.uppercased())
            .foregroundStyle(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 2)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(alignment: .bottom) {
              Rectangle()
                .fill(.white)
                .frame(height: 1)
            }
          
          Text(honeymoon.country.uppercased())
            .foregroundStyle(.black)
            .font(.footnote)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule()
                .fill(.white)
            )
          
        }
        .frame(minWidth: 250)
        .padding(.bottom, 50)
      }
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 600)) {
  CardView(honeymoon: honneymoonData[1])
}
