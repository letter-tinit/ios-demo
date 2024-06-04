//
//  StartButtonView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - PROPERTY
  
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  
  // MARK: - BODY
    var body: some View {
      Button {
        isOnboarding = false
      } label: {
        HStack {
          Text("Start")
          
          Image(systemName: "arrow.right.circle")
            .imageScale(.large)
            .tint(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
          Capsule().stroke(Color(.white))
        )
      }
      .tint(.white)
    }
}

// MARK: - PREVIEW
#Preview {
    StartButtonView()
      .preferredColorScheme(.dark)
}
