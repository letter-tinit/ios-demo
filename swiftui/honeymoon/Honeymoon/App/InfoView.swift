//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct InfoView: View {
  // MARK: - PROPERTY
  
  @Environment(\.dismiss) var dismiss
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView() {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        
        Spacer()
        
        Text("App Info")
          .fontWeight(.black)
          .modifier(TitleModifier())
        
        AppInfoView()
        
        Text("Credits")
          .fontWeight(.black)
          .modifier(TitleModifier())
        
        CreditsView()
        
        Spacer(minLength: 10)
        
        Button {
          // ACTION
          dismiss()
          
        } label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        }
        
      }//: VSTACK
    }//: SCROLLVIEW
    .scrollIndicators(.hidden)
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding(.top, 15)
    .padding(.bottom, 25)
    .padding(.horizontal, 25)
  }
}

// MARK: PREVIEW
#Preview {
  InfoView()
}

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
      RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
      RowAppInfoView(itemOne: "Developer", itemTwo: "Tin")
      RowAppInfoView(itemOne: "Designer", itemTwo: "Tin")
      RowAppInfoView(itemOne: "GitHub", itemTwo: "github.com/tinit4ever")
      RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
    }
  }
}

struct RowAppInfoView: View {
  // MARK: - PROPERTY
  
  var itemOne: String
  var itemTwo: String
  
  var body: some View {
    VStack {
      HStack {
        Text(itemOne)
          .foregroundStyle(.gray)
        
        Spacer()
        
        Text(itemTwo)
      }
      
      Divider()
    }
  }
}

struct CreditsView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Photos")
          .foregroundStyle(.gray)
        
        Spacer()
        
        Text("Unplash")
      }
      
      Divider()
      
      Text("Photographers")
        .foregroundStyle(.gray)
      
      Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
        .multilineTextAlignment(.leading)
        .font(.footnote)
    }
  }
}
