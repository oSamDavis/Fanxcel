//
//  SearchBarView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - PPTIES
    @Binding var text: String
    var color: Color = Color(.secondarySystemFill)
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                TextField("Search", text: $text)
                    .font(.body)
                    .foregroundColor(.white)
            
            Image(systemName: "mic.fill")
                .foregroundColor(.white)
            }
            .padding(7)
            .background(color)
            .cornerRadius(10)

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
