//
//  CBLList.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 14/05/22.
//

import SwiftUI

struct CBLList: View {
    @EnvironmentObject var manager: CBLManager
    @State private var isExpanded = false
    var body: some View {
            List {
                Section {
                    if(!manager.manager.isEmpty){
                        ForEach(manager.manager, id: \.id){ CBL in
                            
                            CBLRow(CBL: CBL).environmentObject(CBLManager())

                        }
                        .onDelete { index in
                            manager.manager.remove(atOffsets: index)
                            CBLManager.save(CBLManager: manager.manager) { result in
                                if case .failure(let error) = result {
                                    fatalError(error.localizedDescription)
                                }
                                
                            }
                            
                        }
                    }
                }
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Lista de CBLs")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        VStack{
                            Label("New", systemImage: "plus")
                        }
                    }
                }
                
            }
            .sheet(isPresented: $isExpanded) {
                NavigationView{
                    CBLAdd()
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button{
                                    isExpanded.toggle()
                                } label: {
                                    Text("Done")
                                }
                            }
                        }
                }
            }
            .onAppear{
                print(manager.manager)
            }
        
    }
}

struct CBLList_Previews: PreviewProvider {
    
    static var previews: some View {
        CBLList()
            .environmentObject(CBLManager())
    }
}
