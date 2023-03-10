//
//  GiftCard.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct GiftCard: View {
    var body: some View {
        ZStack {
            
            Color.white.opacity(0.5)
            HStack {
                Text("Use your points to redeem a pool of gift assers available to you")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                
                Image("ball")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .clipped()
                    
                
                
            }
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
     
        .cornerRadius(25)
    }
}

struct GiftCard_Previews: PreviewProvider {
    static var previews: some View {
        GiftCard()
    }
}
