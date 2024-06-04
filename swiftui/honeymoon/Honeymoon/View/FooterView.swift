//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct FooterView: View {
  // MARK: - PROPERTY
  
  @Binding var isShowingAlert: Bool
  let haptics = UINotificationFeedbackGenerator()
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Image(systemName: "xmark.circle")
        .font(.system(size: 42, weight: .light))
      
      Spacer()
      
      Button {
        playSound(sound: "sound-click", type: "mp3")
        self.haptics.notificationOccurred(.success)
        self.isShowingAlert.toggle()
      } label: {
        Text("Book Destination".uppercased())
          .font(.system(.subheadline, design: .rounded))
          .fontWeight(.heavy)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .tint(.pink)
          .background(
            Capsule().stroke(.pink, lineWidth: 2)
          )
      }
      
      Spacer()
      
      Image(systemName: "heart.circle")
        .font(.system(size: 42, weight: .light))
    }
    .padding()
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 80)) {
  @State var isShowingAlert: Bool = false
  return FooterView(isShowingAlert: $isShowingAlert)
}
