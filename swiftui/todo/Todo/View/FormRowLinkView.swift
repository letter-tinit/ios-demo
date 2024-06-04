//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct FormRowLinkView: View {
  // MARK: - PROPERTY
  var icon: String
  var color: Color
  var text: String
  var link: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(self.color)
        
        Image(systemName: self.icon)
          .scaledToFit()
          .foregroundStyle(.white)
      }
      .frame(width: 36, height: 36)
      
      Text(text)
        .foregroundStyle(.secondary)
      
      Spacer()
      
      Button {
        // MARK: - OPEN A LINK
        guard let url = URL(string: self.link),
              UIApplication.shared.canOpenURL(url)
        else {
          return
        }
        
        UIApplication.shared.open(url as URL)
      } label: {
        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
      }
      .tint(.secondary)
    }
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 60)) {
  FormRowLinkView(icon: "globe", color: .pink, text: "GitHub", link: "https://github.com/tinit4ever")
    .padding()
}
