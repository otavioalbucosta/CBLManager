//
//  CBLManagerApp.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 13/05/22.
//

import SwiftUI

@main
struct CBLManagerApp: App {
    @StateObject private var manager = CBLManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
