//
//  ThemeSetting.swift
//  Todo
//
//  Created by Treasure Letter on 16/03/2024.
//

import SwiftUI

class ThemeSetting: ObservableObject {
  @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
}
