//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HeaderComponent: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Capsule()
        .frame(width: 120, height: 6)
        .foregroundStyle(.secondary)
        .opacity(0.3)
      
      Image("logo-honeymoon")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
    }
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 80)) {
  HeaderComponent()
}
