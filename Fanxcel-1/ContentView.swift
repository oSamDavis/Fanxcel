//
//  ContentView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WatchView()
                .tabItem{
                    Image(systemName: "play.tv.fill")
                    Text("Watch")
                }
            HighlightView()
                .tabItem{
                    Image(systemName: "figure.rugby")
                    Text("Higlight")
                }

            ARStatsView()
                .tabItem{
                    Image(systemName: "dot.viewfinder")
                    Text("AR")
                }
            TeamView()
                .tabItem{
                    Image(systemName: "shared.with.you")
                    Text("Teams")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
