//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTY
  
  @Binding var isShowingInfoView: Bool
  @Binding var isShowingGuideView: Bool
  
  let haptics = UINotificationFeedbackGenerator()

  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button {
        print("Information")
        playSound(sound: "sound-click", type: "mp3")
        self.haptics.notificationOccurred(.success)
        self.isShowingInfoView.toggle()
      } label: {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
      }
      .tint(.primary)
      .sheet(isPresented: $isShowingInfoView) {
        InfoView()
      }
      
      Spacer()
      
      Image("logo-honeymoon-pink")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
      
      Spacer()
      
      Button {
        // ACTION
        playSound(sound: "sound-click", type: "mp3")
        self.haptics.notificationOccurred(.success)
        self.isShowingGuideView.toggle()
      } label: {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
      }
      .tint(.primary)
      .sheet(isPresented: $isShowingGuideView) {
        GuideView()
      }
    }
    .padding()
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 80)) {
  HeaderView(isShowingInfoView: .constant(false), isShowingGuideView: .constant(false))
}
