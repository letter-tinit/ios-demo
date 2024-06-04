//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI

struct IconView: View {
    // MARK: - PROPERTY
  var imageName: String

    // MARK: - BODY
  
  var body: some View {
    HStack {
      Image(uiImage: UIImage(named: imageName) ?? UIImage())
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: 44, height: 44)
        .cornerRadius(8)
      
      Spacer()
        .frame(width: 10)
      
      Text(imageName)
        .frame(alignment: .leading)
    } //: HSTACK
    .padding(3)
  }
}

// MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  IconView(imageName: "Blue")
}
