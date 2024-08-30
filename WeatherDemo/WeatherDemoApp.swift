//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Ricardo Ortega on 8/30/24.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
