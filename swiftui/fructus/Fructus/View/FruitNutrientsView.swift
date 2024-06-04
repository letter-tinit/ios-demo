//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - PROPERTY
  
  var fruit: Fruit
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Materials"]
  
  // MARK: - BODY
  
  var body: some View {
    GroupBox {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(0..<nutrients.count, id: \.self) { index in
          Divider().padding(.vertical, 2)
          
          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrients[index])
            }
            .foregroundStyle(fruit.gradientColors[1])
            .font(Font.system(.body).bold())
            
            Spacer(minLength: 25)
            
            Text(fruit.nutrition[index])
              .multilineTextAlignment(.trailing)
          }
        }
      }
    }
  }
}

// MARK: - PREVIEW

#Preview {
  FruitNutrientsView(fruit: fruitsData[1])
}
