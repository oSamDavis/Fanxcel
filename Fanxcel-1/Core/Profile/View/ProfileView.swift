//
//  ProfileView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var searchBarText: String = ""
    
    var body: some View {
        ZStack {
            Color.NFLBlue.edgesIgnoringSafeArea(.top)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack(alignment: .trailing) {
                        ProfileCard(image: "image-10")
                            .padding()
                            .shadow(radius: 4)
                        
                        Image(systemName: "pencil")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 30)
                            .padding()
                            .background(Circle().fill(Color.NFLBlue))
                            .offset(x: 20)
                        
                    }
                        
                        
                    Text("Arthur Rahming".uppercased())
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Premium 👑")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.darkGray)
                    
                    HStack {
                        VStack{
                            Text("Favorite")
                            Text("Team")
                        }
                        .bold()
                        Spacer()
                        
                        Image("steelers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Spacer()
                        VStack{
                            Text("300")
                            Text("Points")
                        }
                        .bold()
                        Spacer()
                        
                        Image("coin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    Spacer()
                    
                    HeaderView(text: "Collections")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                  
                        ProfileCard(image: "image-3")
                            .shadow(radius: 4)
                            .padding()
                        ProfileCard(image: "image-2")
                            .shadow(radius: 4)
                            .padding()
                        ProfileCard(image: "image-5")
                            .shadow(radius: 4)
                            .padding()
                        ProfileCard(image: "image-4")
                            .shadow(radius: 4)
                            .padding()
                        
                    }
                    
                }
                .padding(.horizontal, 7)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


