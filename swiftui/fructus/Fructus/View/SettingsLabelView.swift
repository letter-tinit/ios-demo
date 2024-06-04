//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTY
  var labelText: String
  var labelImage: String

    // MARK: - BODY

    var body: some View {
      HStack {
        Text(labelText.uppercased())
          .fontWeight(.bold)
        
        Spacer()
        
        Image(systemName: labelImage)
      }
    }
}

// MARK: PREVIEW
#Preview {
  SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
}
