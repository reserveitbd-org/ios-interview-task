//
//  ScrollCategoryView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct ScrollCategoryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .padding(.horizontal, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10){ _ in
                        Image("cuisine card")
                            .border(Color.gray, width: 0.2)
                    }
                }
            }
        }
        
    }
}

struct ScrollCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollCategoryView()
    }
}
