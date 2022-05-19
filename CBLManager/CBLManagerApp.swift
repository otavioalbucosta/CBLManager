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
            NavigationView {
                CBLList()
                    .environmentObject(manager)
            }
            .onAppear {
                CBLManager.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let CBLs):
                        manager.manager = CBLs
                    }
                    print(manager.manager)
                }
            }
        }
    }
}
