//
//  CBLList.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 14/05/22.
//

import SwiftUI

struct CBLList: View {
    @EnvironmentObject var manager: CBLManager
    var body: some View {
        NavigationView {
            List {
                Section {
                    if(!manager.manager.isEmpty){
                        ForEach(manager.manager, id: \.id){ CBL in
                            CBLRow(CBL: CBL)
                        }
                    }
                }
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Lista de CBLs")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        
                    }) {
                        VStack{
                            Label("New", systemImage: "plus")
                        }
                    }
                }
                
            }
        }
    }
}

struct CBLList_Previews: PreviewProvider {
    
    static var previews: some View {
        CBLList()
            .environmentObject(CBLManager())
    }
}
