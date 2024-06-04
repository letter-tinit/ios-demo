//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Treasure Letter on 29/03/2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(.pink)
  }
}

