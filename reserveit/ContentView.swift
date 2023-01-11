//
//  ContentView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var text: String = ""

    var body: some View {
        VStack {
            TopNavView()
            Spacer()
            ScrollView {
                Searchbar(text: $text)
                ScrollBannerView()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 170)
                ScrollCategoryView()
                ScrollNewCollectionView(text: text)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
