//
//  PlayerCard.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct PlayerCard: View {
    
    var image: String = "player-1"
    var name: String = "Mason Rudolph"
    var number: String = "QB #5"
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Image
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160, alignment: .top)
           
            
            // MARK: - Details
            VStack(spacing: 0) {
                Text(name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text(number)
                        .foregroundColor(Color.NFLPink)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .padding(.horizontal)
            .padding(.vertical)
            .background(.white)
        }
        .frame(width: 200)
        .cornerRadius(20)
        .padding(.horizontal, 8)
    }
}

struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCard()
    }
}
