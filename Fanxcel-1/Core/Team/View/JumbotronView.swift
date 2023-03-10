//
//  JumbotronView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/10/23.
//

import SwiftUI

struct JumbotronView: View {
    var body: some View {
        ZStack {
            
            Color.purple.opacity(0.8)
            HStack {
                Text("Upload a picture of yourself enjoying the game from home and stand a chance to be featured on the game day jumbotron.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                
                Image("yellow-billboard")
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

struct JumbotronView_Previews: PreviewProvider {
    static var previews: some View {
        JumbotronView()
    }
}
