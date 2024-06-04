//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct FormRowStaticView: View {
  // MARK: - PROPERTY
  
  var icon: String
  var firstText: String
  var secondText: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(.gray)
        
        Image(systemName: icon)
          .foregroundStyle(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(firstText)
      
      Spacer()
      
      Text(secondText )
    }
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 60)) {
  FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
    .padding()
}
