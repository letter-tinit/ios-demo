//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct SettingsRowView: View {
  // MARK: - PROPERTY
  var name: String
  var content: String? = nil
  var linkLabel: String? = nil
  var linkDestination: String? = nil
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)
      
      HStack {
        Text(name)
          .foregroundStyle(.gray)
        
        Spacer()
        
        if content != nil {
          Text(content!)
        } else if (linkLabel != nil && linkDestination != nil) {
          Link(
            destination: URL(string: linkDestination!)!,
            label: {
              Text(linkLabel!)
            })
          Image(systemName: "arrow.up.right.square")
            .foregroundStyle(.pink)
        } else {
          EmptyView()
        }
      }
    }
  }
}

#Preview(traits: .fixedLayout(width: 375, height: 60)) {
  SettingsRowView(name: "Developer", linkLabel: "TiniT", linkDestination: "https://github.com/tinit4ever")
    .padding()
}

#Preview(traits: .fixedLayout(width: 375, height: 60)) {
  SettingsRowView(name: "Developer", content: "Tin")
    .padding()
}
