//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTY
  
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  @Environment(\.dismiss) var dismiss
  @Environment(\.managedObjectContext) var managedObjectContext
  
  let priorities = ["High", "Normal", "Low"]
  
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  
  // MARK: - THEME
  
  var themes: [Theme] = themesData
  @ObservedObject var theme = ThemeSetting()

  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack(alignment: .leading, spacing: 20) {
          // MARK: - TODO NAME
          TextField("Todo", text: $name)
            .padding()
            .background(
              Color(UIColor.tertiarySystemFill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 9))
            .font(.system(size: 24, weight: .bold, design: .default))
          
          // MARK: - TODO PRIORITY
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(.segmented)
          
          // MARK: - SAVE BUTTON
          Button {
            // Action
            guard self.name != "" else {
              self.errorShowing = true
              self.errorTitle = "Invalid Name"
              self.errorMessage = "Make sure fill all box"
              return
            }
            
            let todo = Todo(context: managedObjectContext)
            todo.name = self.name
            todo.priority = self.priority
            
            do {
              try self.managedObjectContext.save()
              self.dismiss()
            } catch {
              print(error)
            }
            
          } label: {
            Text("Save")
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(themes[self.theme.themeSettings].themeColor)
              .clipShape(RoundedRectangle(cornerRadius: 9))
              .foregroundStyle(.white)
          }//: SAVE BUTTON
          
        }//: VSTACK
        .padding(.horizontal)
        .padding(.vertical, 30)
        
        Spacer()
      }//: VSTACK
      .navigationTitle("New Todo")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            self.dismiss()
          } label: {
            Image(systemName: "xmark")
          }
        }
      }
      .alert(Text(errorTitle), isPresented: $errorShowing) {
        Button {
          // ACTION
          
        } label: {
          Text("OK")
        }
      } message: {
        Text(errorMessage)
      }
    }//: NAVIGATION
    .tint(themes[self.theme.themeSettings].themeColor)
  }
}

// MARK: PREVIEW
#Preview {
  AddTodoView()
}
