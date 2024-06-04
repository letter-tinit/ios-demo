//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct FruitHeaderView: View {
  // MARK: - PROPERTY
  
  @State private var isAnimatingImage: Bool = false
  
  var fruit: Fruit
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      LinearGradient(
        colors: fruit.gradientColors,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      
      Image(fruit.image)
        .resizable()
        .scaledToFit()
        .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
        .padding(.vertical, 20)
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
    }
    .frame(height: 440)
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimatingImage = true
      }
    }
  }
}

// MARK: - PREVIEW
#Preview {
  FruitHeaderView(fruit: fruitsData[1])
}
