//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Treasure Letter on 29/03/2024.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(
        Capsule().fill(.pink)
      )
      .foregroundStyle(.white)
  }
}
