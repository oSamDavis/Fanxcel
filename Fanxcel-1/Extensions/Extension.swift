//
//  Extension.swift
//  BOTB-Design-System
//
//  Created by Sam Davis Omekara  on 3/9/23.
//


import SwiftUI

extension Color {
    static let NFLPink = Color("NFLPink")
    static let NFLBlue = Color("NFLBlue")
    static let darkGray = Color("DarkGray")
}


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
       // 1. Locate the JSON file.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to located \(file) in bundle.")
        }
        
       // 2. Create ppty for data.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
       // 3. Create a decoder.
        let decoder = JSONDecoder()
        
       // 4. Create ppty for decoded data.
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
       
       // 5. Return the ready-to-use data.
        return loaded
    }
}


