//
//  ContentView.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: CBLManager
    var body: some View {
        CBLList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
