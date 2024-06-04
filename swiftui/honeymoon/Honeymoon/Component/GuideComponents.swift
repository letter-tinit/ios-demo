//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct GuideComponents: View {
  // MARK: - PROPERTY
  var title: String
  var subtitle: String
  var description: String
  var icon: String
  
  // MARK: - BODY

  var body: some View {
    HStack(alignment: .center, spacing: 20) {
      Image(systemName: icon)
        .font(.largeTitle)
        .foregroundStyle(.pink)
      
      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text(title.uppercased())
            .font(.title)
          .fontWeight(.heavy)
          
          Spacer()
          
          Text(subtitle.uppercased())
            .font(.footnote)
            .fontWeight(.heavy)
            .foregroundStyle(.pink)
            
        }
        
        Divider().padding(.bottom, 4)
        
        Text(description)
          .font(.footnote)
          .foregroundStyle(.secondary)
          .fixedSize(horizontal: false, vertical: true)
      }
      
      
    }//: HSTACK
  }
}

// MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  GuideComponents(
    title: "Title",
    subtitle: "Swipe right",
    description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.",
    icon: "heart.circle"
  )
}
