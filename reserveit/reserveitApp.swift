//
//  reserveitApp.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 10/1/23.
//

import SwiftUI

@main
struct reserveitApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavBarView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            PersistenceController.preview.save()
        }
    }
}
