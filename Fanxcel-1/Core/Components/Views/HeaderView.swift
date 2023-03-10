//
//  HeaderView.swift
//  Fanxcel-1
//
//  Created by Sam Davis Omekara  on 3/9/23.
//

import SwiftUI

struct HeaderView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.system(.title, design: .rounded))
            .fontWeight(.bold)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(text: "Hello")
    }
}


extension HeaderView {
    

}
