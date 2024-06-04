//
//  FruitRowView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct FruitRowView: View {
  // MARK: - PROPERTY
  
  var fruit: Fruit
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(fruit.image)
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80, alignment: .center)
        .shadow(radius: 3, x: 2, y: 2)
        .background(
          LinearGradient(
            colors: fruit.gradientColors,
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
      
      VStack(alignment: .leading, spacing: 5) {
        Text(fruit.title)
          .font(.title2)
          .fontWeight(.bold)
        
        Text(fruit.headline)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    } //:HSTACK
  }
}

// MARK: - PREVIEW
#Preview {
  FruitRowView(fruit: fruitsData[1])
}
