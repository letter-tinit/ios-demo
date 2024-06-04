//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct IconPickerView: View {
  // MARK: - PROPERTY
  
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var iconSettings: IconNames
  
  // MARK: - BODY
  
  var body: some View {
    List {
      Picker(selection: $iconSettings.currentIndex) {
        ForEach(0..<iconSettings.iconNames.count) { index in
          HStack {
            Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
              .renderingMode(.original)
              .resizable()
              .scaledToFit()
              .frame(width: 44, height: 44)
              .cornerRadius(8)
            
            Spacer().frame(width: 8)
            
            Text(self.iconSettings.iconNames[index] ?? "Blue")
              .frame(alignment: .leading)
          } //: HSTACK
          .padding(3)
        }
      } label: {
        Text("Themes Picker")
          .font(.title)
          .padding(.vertical)
      }//: PICKER
      .pickerStyle(.inline)
      .onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
        let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
        if index != value {
          UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
            if let error = error {
              print(error.localizedDescription)
            } else {
              print("Success! You have changed the app icon.")
              self.dismiss()
            }
          }
        }
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  IconPickerView()
    .environmentObject(IconNames())
}
