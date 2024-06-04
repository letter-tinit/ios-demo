//
//  ContentView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct ContentView: View {
  // MARK: PROPERTY
  
  @State private var isShowingSettings: Bool = false
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(fruits.shuffled()) { fruit in
          NavigationLink {
            FruitDetailView(fruit: fruit)
          } label: {
            FruitRowView(fruit: fruit)
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("Fruits")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isShowingSettings = true
          } label: {
            Image(systemName: "slider.horizontal.3")
          }//: BUTTON
          .sheet(isPresented: $isShowingSettings) {
            SettingsView()
          }
        }
      }
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW
#Preview {
  ContentView(fruits: fruitsData)
}
