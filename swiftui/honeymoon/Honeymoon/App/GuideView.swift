//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct GuideView: View {
  // MARK: - PROPERTY
  
  @Environment(\.dismiss) var dismiss
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        
        Spacer(minLength: 20)
        
        Text("Get Started!")
          .fontWeight(.black)
          .modifier(TitleModifier())
        
        Text("Discover and pick the perfect destination for your romantic Honeymoon!")
          .lineLimit(nil)
          .multilineTextAlignment(.center)
        
        Spacer(minLength: 10)
        
        VStack(alignment: .center, spacing: 25) {
          GuideComponents(
            title: "Like",
            subtitle: "Swipe right",
            description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites.",
            icon: "heart.circle"
          )
          
          GuideComponents(
            title: "Dismiss",
            subtitle: "Swipe left",
            description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
            icon: "xmark.circle"
          )
          
          GuideComponents(
            title: "Book",
            subtitle: "Tap the button",
            description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together",
            icon: "checkmark.square"
          )
        }
        
        Spacer(minLength: 10)

        Button {
          // ACTION
          self.dismiss()
        } label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    }
  }
}

// MARK: PREVIEW
#Preview {
  GuideView()
}
