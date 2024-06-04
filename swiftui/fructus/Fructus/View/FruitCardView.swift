//
//  FruitCardView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct FruitCardView: View {
  // MARK: - PROPERTY
  var fruit: Fruit
  
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      VStack {
        // FRUIT: IMAGE
        Spacer()
        
        Image(fruit.image)
          .resizable()
          .frame(maxHeight: 530)
          .aspectRatio(1, contentMode: .fit)
          .shadow(color: .black.opacity(0.3),radius: 8, x: 6, y: 8)
          .scaleEffect(isAnimating ? 1.0 : 0.6)
        
        // FRUIT: TITLE
        Text(fruit.title)
          .font(.largeTitle)
          .bold()
          .foregroundStyle(.white)
          .shadow(color: .black.opacity(0.3),radius: 2, x: 2, y: 2)
        // FRUIT: HEADLINE
        Text(fruit.headline)
          .foregroundStyle(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)
        
        // BUTTON: START
        Spacer(minLength: 140)
        
        StartButtonView()
        
        Spacer(minLength: 40)
      } //: VSTACK
    } //: ZSTACK
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(
      LinearGradient(
        colors: fruit.gradientColors ,
        startPoint: .top,
        endPoint: .bottom
      )
    )
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .padding(.horizontal ,20)
  }
}

// MARK: - PREVIEW
#Preview {
  FruitCardView(fruit: fruitsData[1])
  .previewLayout(.fixed(width: 320, height: 640))
}
