//
//  VideoCard.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct VideoCard: View {
    var name: String = "Alex's Watch Party"
    var play: String = "Faclons vs Broncos"
    var image = "image-1"
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .overlay(alignment: .topLeading){
                    HStack {
                        Circle()
                            .frame(width: 3)
                        Text("Live")
                            .font(.caption2)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 2)
                    .background(
                        Capsule().fill(Color.NFLPink)
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                }
            
            VStack{
                
                HStack {

                    VStack(alignment: .leading,spacing: 0) {
                        Text(name)
                            .foregroundColor(.black)
           
                        Text(play)
                            .foregroundColor(Color.darkGray)
                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    HStack(spacing: 3) {
                        Image(systemName: "eye")
                            .foregroundColor(Color.NFLPink)
                        Text("1.3k")
                            .foregroundColor(Color.NFLPink)
                    }
   
             
                    
                    
                    Spacer()
                    
                }
                .font(.caption)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
    
        }
        .background(Color.white)
        .frame(width: 220)
        .cornerRadius(15)
        
        
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.NFLBlue)
    }
}
