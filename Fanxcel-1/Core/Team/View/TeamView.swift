//
//  TeamView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct TeamView: View {
    @State private var searchBarText: String = ""
    
    var body: some View {
        ZStack {
            Color.NFLBlue
                .edgesIgnoringSafeArea(.top)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    SearchBarView(text: $searchBarText)
             
                    HeaderView(text: "Your Team")
                        .foregroundColor(.white)
                
                    teamCard
                    Divider()
                        .background(Color.white)

                    HeaderView(text: "Players")
                        .foregroundColor(.white)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            PlayerCard()
                            PlayerCard(image: "player-1", name: "Minkah Fitzpatrix", number: "FS #39")
                            PlayerCard(image: "player-2", name: "Diontae Johnson", number: "WR #18")
                            PlayerCard(image: "player-3", name: "Stephone Tuitt", number: "DE #91")
                            PlayerCard(image: "player-4", name: "Cameron Heyward", number: "DT #97")
                  
                            
                        }
                    }
                    
                    HeaderView(text: "Gift Assets")
                        .foregroundColor(.white)
                    
                    GiftCard()
                    
                    HeaderView(text: "Jumbotron View")
                        .foregroundColor(.white)
                    
                    JumbotronView()
             
                    
             
                    

                    
                }
                .padding(.horizontal)
            }
        }
        
        
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}


extension TeamView {
    
    var teamCard : some View {
        VStack {
            HStack{
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Pittsburgh Steelers")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Record")
                            Text("9-6")
                                .foregroundColor(Color.NFLPink)
                        }
                        HStack {
                            Text("6th")
                                .foregroundColor(Color.NFLPink)
                            Text("in the AFC")
                        }
                    }
                    .bold()
           
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("steelers")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }
        }
        .frame(height: 193)
        .background(
            .ultraThinMaterial.opacity(0.46)
         
        )
        .cornerRadius(20)
        
    }
}
