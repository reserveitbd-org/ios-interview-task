//
//  TopNavView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct TopNavView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Ellipse 23")
                HStack {
                    Button(action: {}) {
                        Image("location")
                        VStack(alignment: .leading) {
                            Text("Dhanmondi")
                                .foregroundColor(.white)
                                .font(.system(size: 13))
                            Text("Dhaka")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                        }
                    }
                    Spacer()
                    Button(action: {}) {
                        Image("clarity_notification-outline-badged")
                    }
                }
                .padding(20)
            }
            //            HStack {
            //                Image("Ellipse 26")
            //                Spacer()
            //                Image("Ellipse 25")
            //            }
        }
    }
}

struct TopNavView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavView()
    }
}
