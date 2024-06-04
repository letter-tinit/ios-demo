//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct EmptyListView: View {
  // MARK: - PROPERTY
  
  @State private var isAnimated: Bool = false
  
  let images: [String] = [
    "illustration-no1",
    "illustration-no2",
    "illustration-no3"
  ]
  
  let tips: [String] = [
    "Use your time wisely.",
    "Slow and steady wins the race.",
    "Keep it short and sweet",
    "Put hard tasks first.",
    "Reward yourself after work.",
    "Collect tasks ahead of time.",
    "Each night schedule for tomorow."
  ]
  
  // MARK: - THEME
  
  var themes: [Theme] = themesData
  @ObservedObject var theme = ThemeSetting()
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 20) {
        Image(self.images.randomElement() ?? self.images[0])
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
          .layoutPriority(1)
          .foregroundStyle(self.themes[self.theme.themeSettings].themeColor )
        
        Text(self.tips.randomElement() ?? self.tips[0])
          .layoutPriority(0.5)
          .font(.system(.headline, design: .rounded))
          .foregroundStyle(self.themes[self.theme.themeSettings].themeColor)
      }//: VSTACK
      .padding(.horizontal)
      .opacity(isAnimated ? 1 : 0)
      .offset(y: isAnimated ? 0 : -50)
      .animation(.easeOut(duration: 1.5), value: self.isAnimated)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
          self.isAnimated.toggle()
        }
      }
    }//: ZSTACK
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(
      Color("ColorBase")
    )
    .ignoresSafeArea()
  }
}

// MARK: PREVIEW
#Preview {
  EmptyListView()
}
