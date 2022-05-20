//
//  InvestigateRow.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 17/05/22.
//

import SwiftUI

struct InvestigateRow: View {
    var CBL: CBL
    @EnvironmentObject var manager: CBLManager
    @State private var isExpanded : Bool = false
    @State private var openedSheet = false
    
    var CBLIndex: Int {
        manager.manager.firstIndex(where: {$0.id == CBL.id})!
    }

    var body: some View {
        Button(action: {
            openedSheet = true
        }) {
            VStack {
                HStack {
            
                    Label("Investigate", systemImage: Investigate.icon)
                        .font(.title)
                        .imageScale(.large)
                        .foregroundColor(.blue)

                    Spacer()
                }
                Text(Investigate.desc)
                    .foregroundColor(Color("CardText"))
                .font(.body)
                .multilineTextAlignment(.leading)
                .transition(.move(edge: .leading).animation(.linear))
                .overlay(
                  GeometryReader { proxy in
                    Button(action: {
                      isExpanded.toggle()
                    }) {
                      Text(isExpanded ? "read less...": "read more...")
                    }
                    .frame(width: proxy.size.width-5, height: proxy.size.height+20, alignment: .bottomTrailing)
                    
                    
                  }
                )


            }
            .frame(height: isExpanded ? 300 : 150, alignment: .leading)
            .padding()
            .sheet(isPresented: $openedSheet){
                NavigationView {
                    InvestigateForm(investigate: $manager.manager[CBLIndex].investigate)
                        .toolbar {
                            
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save"){
                                    CBLManager.save(CBLManager: manager.manager) { result in
                                        if case .failure(let error) = result {
                                            fatalError(error.localizedDescription)
                                        }
                                        print(manager.manager)
                                        print(CBLManager().manager)
                                    }
                                    openedSheet = false
                                }
                            }
                        }
                }
                
            }
        }
        
    }
}

struct InvestigateRow_Previews: PreviewProvider {
    static var previews: some View {
        InvestigateRow(CBL: CBLManager().manager[0])
    }
}
