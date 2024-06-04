//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Treasure Letter on 22/03/2024.
//

import SwiftUI

struct SourceLinkView: View {
  var body: some View {
    GroupBox {
      HStack {
        Text("Content source")
        
        Spacer()
        
        Link(destination: URL(string: "https://wikipedia.com")!) {
          Text("Wikipedia")
        }
        
        Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
    }
  }
}

#Preview {
  SourceLinkView()
    .padding()
}
