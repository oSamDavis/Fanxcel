//
//  ProfileCard.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/10/23.
//

import SwiftUI

struct ProfileCard: View {
    var image: String = "watch"
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 250)
            
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 340, height: 230)
           
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.NFLBlue)
   
    }
}
