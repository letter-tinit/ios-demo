//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @EnvironmentObject var iconSettings: IconNames
  
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  
  @State private var isShowingAddTodoView: Bool = false
  @State private var isShowingSettingsView: Bool = false
  @State private var isAnimatingButton: Bool = false
  
  // MARK: - THEME
  
  var themes: [Theme] = themesData
  @ObservedObject var theme = ThemeSetting()
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      ZStack {
        List {
          ForEach(self.todos, id: \.self) { todo in
            HStack {
              Circle()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundStyle(self.colorize(priority: todo.priority ?? "Normal"))
              Text(todo.name ?? "Unknown")
              
              Spacer()
              
              Text(todo.priority ?? "Unknown")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(3)
                .frame(minWidth: 62)
                .overlay {
                  Capsule()
                    .stroke(Color.secondary, lineWidth: 0.75)
                }
            }//: HSTACK
          }//: FOREACH
          .onDelete(perform: { indexSet in
            deleteTodo(at: indexSet)
          })
        }//: LIST
        .navigationTitle("Todo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          // MARK: - TOP BAR LEADING
          ToolbarItem(placement: .topBarLeading) {
            EditButton()
              .tint(self.themes[self.theme.themeSettings].themeColor)
          }
          
          // MARK: - TOP BAR TRAILING
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              // ACTION
              self.isShowingSettingsView.toggle()
            } label: {
              Image(systemName: "paintbrush")
                .imageScale(.large)
            }//: SETTING BUTTON
            .tint(self.themes[self.theme.themeSettings].themeColor)
            .sheet(isPresented: $isShowingSettingsView) {
              SettingsView()
                .environmentObject(self.iconSettings)
            }
          }
        }
        
        // MARK: - NO TODO ITEMS
        if todos.count == 0 {
          EmptyListView()
        }
      }//: ZSTACK
      .sheet(isPresented: $isShowingAddTodoView) {
        AddTodoView()
          .environment(\.managedObjectContext, self.managedObjectContext)
      }
      .overlay(alignment: .bottomTrailing) {
        ZStack {
          Group {
            Circle()
              .fill(self.themes[self.theme.themeSettings].themeColor)
              .opacity(self.isAnimatingButton ? 0.2 : 0)
              .scaleEffect(self.isAnimatingButton ? 1 : 0)
              .frame(width: 68, height: 68, alignment: .center)
            
            Circle()
              .fill(self.themes[self.theme.themeSettings].themeColor)
              .opacity(self.isAnimatingButton ? 0.15 : 0)
              .scaleEffect(self.isAnimatingButton ? 1 : 0)
              .frame(width: 88, height: 88, alignment: .center)
          }
          .animation(
            .easeInOut(duration: 2)
            .repeatForever(autoreverses: true)
            , value: self.isAnimatingButton
          )
          
          Button {
            // ACTION
            self.isShowingAddTodoView.toggle()
          } label: {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .scaledToFit()
              .background(
                Circle().fill(Color("ColorBase"))
              )
              .frame(width: 48, height: 48, alignment: .center)
          }//: ADD BUTTON
          .tint(self.themes[self.theme.themeSettings].themeColor)
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
              self.isAnimatingButton.toggle()
            }
          }
        }//:ZSTACK
        .padding(.bottom, 15)
        .padding(.trailing, 15)
      }
    }//: NAVIGATION
    .onAppear {
//      themes = themesData
//      theme = ThemeSetting()
    }
  }
  
  // MARK: - FUNCTION
  
  private func colorize(priority: String) -> Color {
    switch priority {
    case "High":
      return .pink
    case "Normal":
      return .green
    case "Low":
      return .blue
    default:
      return .gray
    }
  }
  
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = self.todos[index]
      
      self.managedObjectContext.delete(todo)
      
      do {
        try self.managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  let persistenceController = PersistenceController.shared
  return ContentView()
    .environment(\.managedObjectContext, persistenceController.container.viewContext)
}
