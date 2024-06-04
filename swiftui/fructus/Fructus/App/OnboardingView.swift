//
//  OnboardingView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTY
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - BODY
    var body: some View {
      TabView {
        ForEach(fruits) { fruit in
          FruitCardView(fruit: fruit)
        } //: LOOP
      } //: TAB
      .tabViewStyle(PageTabViewStyle())
      .padding(.vertical, 20)
    }
}


// MARK: - PREVIEW
#Preview {
    OnboardingView(fruits: fruitsData)
}
