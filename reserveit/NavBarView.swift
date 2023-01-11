//
//  NavBarView.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import SwiftUI

struct NavBarView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            HelloWorldView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            HelloWorldView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
            HelloWorldView()
                .tabItem {
                    Label("Time", systemImage: "clock")
                }
            HelloWorldView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
        .accentColor(.red)
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
