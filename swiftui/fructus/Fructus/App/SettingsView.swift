//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTY
  
  @Environment(\.dismiss) var dismiss
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - SECTION 1
          
          GroupBox {
            Divider().padding(.vertical, 8)
            
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 9))
              
              Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more")
                .font(.footnote)
            }
          } label: {
            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
          }//: GROUP BOX
          
          // MARK: - SECTION 2
          
          GroupBox {
            Divider().padding(.vertical, 4)
            
            Text("If you wish, you can restart the application by toggle thw switch in this box. That way it starts onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundStyle(.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundStyle(.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          } label: {
            SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
          }
          
          // MARK: - SECTION 3

          GroupBox {
            SettingsRowView(name: "Developer", content: "Tin")
            SettingsRowView(name: "Designer", content: "Tin")
            SettingsRowView(name: "Github", linkLabel: "TiniT", linkDestination: "https://github.com/tinit4ever")
            SettingsRowView(name: "Compatibility", content: "iOS 17")
            SettingsRowView(name: "SwiftUI", content: "5.0")
            SettingsRowView(name: "Version", content: "1.1.0")
          } label: {
            HStack {
              Text("Application".uppercased())
              
              Spacer()
              
              Image(systemName: "apps.iphone")
            }
          }
          
        }//:VSTACK
        .padding()
      }//: SCROLL
      .navigationTitle("Setting")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark")
          }
        }
      }
    }//: NAVIGATION
  }
}

// MARK: PREVIEW
#Preview {
  SettingsView()
}
