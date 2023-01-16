//
//  Searchbar.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct Searchbar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .frame(height: 38)
            .padding(.horizontal, 40)
            .background(Color(.systemGray6))
            .cornerRadius(18)
            .padding(.horizontal, 15)
            .overlay(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(width: 18, height: 18)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
            )
    }
}

struct Searchbar_Previews: PreviewProvider {
    @State static var text = "Hello"
    static var previews: some View {
        Searchbar(text: $text)
    }
}
