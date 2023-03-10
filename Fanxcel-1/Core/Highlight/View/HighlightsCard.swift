//
//  HighlightsCard.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct HighlightsCard: View {
    
    var game: Game
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("9 Mar")
                Text(game.stadium)
                    .foregroundColor(.darkGray)
                    .bold()
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                TeamCard(team: game.team1Name, teamImage: game.team1Icon)
                    
                FinalCard(score: game.finalScore)
                    .offset(y: -20)
                TeamCard(team: game.team2Name, teamImage: game.team2Icon)
            }
            .padding(.top)
                
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.white)
        .cornerRadius(20)

    }
}

struct HighlightsCard_Previews: PreviewProvider {
    static let games : [Game] = Bundle.main.decode("game.json")
    static var previews: some View {
        HighlightsCard(game: games[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.NFLBlue)
    }
}



extension HighlightsCard {
    
}


struct TeamCard: View {
    var team: String
    var teamImage: String
    
    var body: some View {
        VStack {
            Image(teamImage)
                .resizable()
                .scaledToFit()
                .frame(width: 66, height: 46)

            
            
            Text(team)
                .font(.footnote)
                .foregroundColor(.NFLBlue)
                .fontWeight(.semibold)
                
        }
        .frame(width: 120)
    }
}

struct FinalCard: View {
    var score: String
    var body: some View {
        VStack(spacing: 8) {
          Text("Final")
                .foregroundColor(.darkGray)
                .fontWeight(.semibold)
            
            
            Text(score)
                .foregroundColor(.NFLPink)
                .fontWeight(.semibold)
        }
        .frame(width: 100)
    }
}
