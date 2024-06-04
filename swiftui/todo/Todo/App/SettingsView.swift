//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI
import UIKit

enum IconName: String, CaseIterable, Identifiable {
  case blue = "Blue"
  case bluelight = "BlueLight"
  case bluedark = "BlueDark"
  case pink = "Pink"
  case pinkDark = "PinkDark"
  case pinkLight = "PinkLight"
  case green = "Green"
  case greenDark = "GreenDark"
  case greenLight = "GreenLight"

  var id: Self { self }
}

struct SettingsView: View {
  // MARK: - PROPERTY
  
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var iconSettings: IconNames
  
  
  // MARK: - THEME
  
  var themes: [Theme] = themesData
  @ObservedObject var theme = ThemeSetting()
  @State private var isThemeChanged: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      VStack {
        // MARK: - FORM
        Form {
          // MARK: - SECTION 1
          Section {
            NavigationLink {
              IconPickerView()
                .environmentObject(self.iconSettings)
            } label: {
              IconView(imageName: self.iconSettings.iconNames[iconSettings.currentIndex] ?? "Blue")
            }
          } header: {
            Text("Choose the app icon")
          }//: SECTION 1
          .padding(.vertical, 3)
          
          // MARK: - SECTION 2
          Section {
            ForEach(themes) { theme in
              Button {
                self.theme.themeSettings = theme.id
                UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                self.isThemeChanged.toggle()
              } label: {
                HStack {
                  Image(systemName: "circle.fill")
                    .foregroundStyle(theme.themeColor)
                  
                  Text(theme.themeName)
                }
              }//: BUTTON
              .tint(.primary)
            }
          } header: {
            HStack {
              Text("Choose the app theme")
              Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundStyle(self.themes[self.theme.themeSettings].themeColor)
            }
          }//:
          .alert(Text("Success"), isPresented: $isThemeChanged) {
            Button {
              // ACTION
              
            } label: {
              Text("OK")
            }
          } message: {
            Text("App has been changed to the \(self.themes[self.theme.themeSettings].themeName). Now clouse and restart it!")
          }

          
          // MARK: - SECTION 3
          
          Section("Follow us on social media") {
            FormRowLinkView(icon: "link", color: .black, text: "GitHub", link: "https://github.com/tinit4ever")
            
            FormRowLinkView(icon: "play.rectangle", color: .blue, text: "Course", link: "http://youtube.com/@tinit4ever")
          }//: SECTION 3
          .padding(.vertical, 3)
          
          // MARK: - SECTION 4
          Section {
            FormRowStaticView(
              icon: "gear",
              firstText: "Application",
              secondText: "Todo"
            )
            
            FormRowStaticView(
              icon: "checkmark.seal",
              firstText: "Compatibility",
              secondText: "iPhone, iPad"
            )
            
            FormRowStaticView(
              icon: "keyboard",
              firstText: "Developer",
              secondText: "Tin"
            )
            
            FormRowStaticView(
              icon: "paintbrush",
              firstText: "Designer",
              secondText: "Tin"
            )
            
            FormRowStaticView(
              icon: "flag",
              firstText: "Version",
              secondText: "1.0.0"
            )
          } header: {
            Text("About the application")
          }//: SECTION 4
          .padding(.vertical, 3)
          
        }//: FORM
        
        // MARK: - FOOTER
        
        Text("Copyright © All rights reserved.\nBetter Apps 💕 Less code")
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .multilineTextAlignment(.leading)
          .foregroundStyle(.secondary)
      }//: VSTACK
      .navigationTitle("Settings")
      .navigationBarTitleDisplayMode(.inline)
      .background(
        Color("ColorBackground")
      )
      // MARK: - NAVIGATION BAR
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            self.dismiss()
          } label: {
            Image(systemName: "xmark")
          }
        }
      }
    }//: NAVIGATION
    .tint(themes[self.theme.themeSettings].themeColor)
  }
}

// MARK: PREVIEW
#Preview {
  SettingsView()
    .environmentObject(IconNames())
}
