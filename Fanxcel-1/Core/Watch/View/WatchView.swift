//
//  WatchView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct WatchView: View {
    @State private var searchBarText: String = ""
    var body: some View {
        ZStack {
            Color.NFLBlue
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                SearchBarView(text: $searchBarText)
                ScrollView(){
                    watchSection
                        .padding(.vertical)
                    
                    partiesSection
                        .padding(.vertical)
                    
                    
                    historySection
                        .padding(.vertical)
                    Spacer()
                }

            }
            .padding(16)
        }
        .foregroundColor(.white)
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}

extension WatchView {
    
    var watchSection: some View {
        VStack{
            HeaderView(text: "Watch")
                .frame(maxWidth: .infinity, alignment: .leading)
    
            ZStack {
                // Image
                Image("watch")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        VStack(spacing: 10) {
                            // TOP: LIVE
                                HStack {
                                    Circle()
                                        .frame(width: 6)
                                    Text("Live")
                                        .font(.headline)
                                }
            
                                .padding(.horizontal, 6)
                                .padding(.vertical, 8)
                                .background(
                                    Capsule().fill(Color.NFLPink)
                                )
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.horizontal)
                            //MIDDLE : PLAY BUTTON
                            Image(systemName: "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .offset(y: 10)
                            
                            Spacer()
                            // BOTTOM : DETAILS
                            HStack {
                                Text("Raven vs Cowboys \nWeek2")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                HStack{
                                    
                                    Image(systemName: "eye")
                                    Text("1.3k Watching")
                                }
                            }
                            .padding(.horizontal)
                        }
                    )
                // OVERLAY ON TOP IMAGE
             
            }
            }
            .foregroundColor(.white)
        }
    
    var partiesSection : some View {
        VStack {
            HStack {
                HeaderView(text: "Ongoing Parties")
                
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundColor(.NFLBlue)
                        .padding(6)
                        .background(Circle().fill(Color.white))
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                   
                        VideoCard(image: "image-8")
                    VideoCard(name: "Raven Bow's Party", image: "image-2")
                        VideoCard(name: "Gueta's Party")
                    VideoCard(name: "Ray's Party", image: "image-5")
                    
                }
            }
        }
        
        
    }
    
    var historySection : some View {
        VStack {
            HStack {
                HeaderView(text: "Back in the Day")
                
                Spacer()
                
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    VideoCard(name: "2012 OMG moments", image: "image-4")
                    VideoCard(name: "2010 Best Highlights", image: "image-7" )
                    VideoCard(name: "90's Downs", image: "image-3")
                    VideoCard(name: "Recent History", image: "image-6")
                
                }
            }
        }
        
        
    }

        
}

