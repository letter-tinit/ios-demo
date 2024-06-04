//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Treasure Letter on 30/03/2024.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundStyle(.white)
      .font(.system(size: 128))
      .shadow(color: .black.opacity(0.2),radius: 12, x: 0, y: 0)
  }
}
