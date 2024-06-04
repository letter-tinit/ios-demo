//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  
  @State var isShowingAlert: Bool = false
  @State var isShowingGuideView = false
  @State var isShowingInfoView = false
  @GestureState private var dragState = DragStage.inactive
  
  @State private var lastCardIndex: Int = 1
  @State private var cardRemovalTransition = AnyTransition.trailingBottom
  
  private var dragAreaThreshold: CGFloat = 65.0
  
  // MARK: - CARD VIEWS
  
  @State var cardViews: [CardView] = {
    var views = [CardView]()
    
    for index in 0..<2 {
      views.append(CardView(honeymoon: honneymoonData[index]))
    }
    
    return views
  }()
  
  // MARK: - FUNCTION
  
  private func isTopCard(cardview: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id ==  cardview.id }) else {
      return false
    }
    
    return index == 0
  }
  
  private func moveCards() {
    cardViews.removeFirst()
    
    self.lastCardIndex += 1
    
    let honeymoon = honneymoonData[lastCardIndex % honneymoonData.count]
    
    let newCardView = CardView(honeymoon: honeymoon)
    
    cardViews.append(newCardView)
  }
  
  
  // MARK: - DRAG STATES
  
  enum DragStage {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
      switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
      }
    }
    
    var isDragging: Bool {
      switch self {
      case .dragging:
        return true
      case .inactive, .pressing:
        return false
      }
    }
    
    var isPressing: Bool {
      switch self {
      case .dragging:
        return false
      case .inactive, .pressing:
        return true
      }
    }
  }
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView(isShowingInfoView: $isShowingInfoView, isShowingGuideView: $isShowingGuideView)
        .opacity(self.dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: self.dragState.isDragging)
      //        .animation(.default)
      
      Spacer()
      
      // MARK: - CARDS
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(self.isTopCard(cardview: cardView) ? 1 : 0)
            .overlay {
              ZStack {
                // X-MARK SYMBOL
                Image(systemName: "x.circle")
                  .modifier(SymbolModifier())
                  .opacity(
                    (self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardview: cardView)) ? 1.0 : 0.0
                  )
                
                // HEART SYMBOL
                Image(systemName: "heart.circle")
                  .modifier(SymbolModifier())
                  .opacity(
                    (self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardview: cardView)) ? 1.0 : 0.0
                  )
              }
            }
            .offset(
              x: self.isTopCard(cardview: cardView) ? self.dragState.translation.width : 0,
              y: self.isTopCard(cardview: cardView) ? self.dragState.translation.height : 0
            )
            .scaleEffect(
              (self.dragState.isDragging && isTopCard(cardview: cardView)) ? 0.8 : 1
            )
            .rotationEffect(
              Angle(
                degrees: self.isTopCard(cardview: cardView) ?  Double(self.dragState.translation.width / 12) : 0.0
              )
            )
//            .animation(.interpolatingSpring(stiffness: 120, damping: 120))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: self.dragState.isDragging)
            .gesture(
              LongPressGesture(minimumDuration: 0.01)
                .sequenced(before: DragGesture())
                .updating(self.$dragState, body: { value, state, transaction in
                  switch value {
                  case .first(true):
                    state = .pressing
                  case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                  default:
                    break
                  }
                })
                .onChanged{ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -self.dragAreaThreshold {
                    self.cardRemovalTransition = .leadingBottom
                  }
                  
                  if drag.translation.width > self.dragAreaThreshold {
                    self.cardRemovalTransition = .trailingBottom
                  }
                }
                .onEnded { value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -self.dragAreaThreshold ||
                      drag.translation.width > self.dragAreaThreshold {
                    playSound(sound: "sound-rise", type: "mp3")
                    self.moveCards()
                  }
                }
            )//: GESTURE
            .transition(self.cardRemovalTransition)
        }
      }
      .padding(.horizontal)
      
      Spacer()
      
      // MARK: - FOOTER
      
      FooterView(isShowingAlert: $isShowingAlert)
        .opacity(dragState.isDragging ? 0.0 : 1.0)
        .animation(.default, value: dragState.isDragging)
      //        .animation(.default)
      
    }//: VSTACK
    .alert(isPresented: $isShowingAlert) {
      Alert(
        title: Text("Success"),
        message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
        dismissButton: .default(
          Text("Happy Honeymoon!")
        )
      )//: ALERT
    }
    .tint(.red)
  }
}

// MARK: PREVIEW
#Preview {
  ContentView()
}
