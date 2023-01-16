//
//  ScrollBannerView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct ScrollBannerView: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(0..<5){ i in
                    Image("Rectangle 14")
                        .frame(width: 323, height: 120)
                       
                }
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        
        
    }
}

struct ScrollBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollBannerView()
    }
}
