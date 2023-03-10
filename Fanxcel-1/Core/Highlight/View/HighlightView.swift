//
//  HighlightView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct HighlightView: View {
    @State private var searchbarText: String = ""
    let games : [Game] = Bundle.main.decode("game.json")
    var body: some View {
        NavigationStack {
            ZStack {
                Color.NFLBlue
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading){
                    SearchBarView(text: $searchbarText)
                    HeaderView(text: "Highlights")
                        .foregroundColor(.white)
                    
                    HStack{
                        Image(systemName: "slider.horizontal.3")
                        Text("All filters")
                    }
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundColor(.white)
                    .background(Capsule().stroke(.white))
                    .padding(.bottom, 8)
                    ScrollView {
                        VStack {
                            ForEach(games) { game in
                                NavigationLink(destination: TikTokStyle() ) {
                                    HighlightsCard(game: game)
                                        .padding(.bottom, 16)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical,8)
              

            }
        }
        .navigationBarHidden(true)
    }
}

struct HighlightView_Previews: PreviewProvider {

    static var previews: some View {
        HighlightView()
    }
}
