//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct FruitDetailView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  var fruit: Fruit
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // HEADER
          FruitHeaderView(fruit: fruit)
          
          VStack(alignment: .leading, spacing: 20) {
            // TITLE
            Text(fruit.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundStyle(fruit.gradientColors[1])
            
            // HEADLINE
            Text(fruit.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)
            
            // NUTRIENTS
            FruitNutrientsView(fruit: fruit)
            
            // SUB HEADLINE
            Text("Learn more about \(fruit.title)".uppercased())
              .fontWeight(.bold)
              .foregroundStyle(fruit.gradientColors[1])
            // DESCRIPTION
            Text(fruit.description)
              .multilineTextAlignment(.leading)
            // LINK
            SourceLinkView()
              .padding(.top, 10)
              .padding(.bottom, 40)
          }
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        } //: VSTACK
      } //: SCROLL VIEW
      .ignoresSafeArea(edges: .top)
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW
#Preview {
  FruitDetailView(fruit: fruitsData[1])
}
