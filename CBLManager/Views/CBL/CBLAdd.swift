//
//  CBLAdd.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 18/05/22.
//

import SwiftUI

struct CBLAdd: View {
    @EnvironmentObject var manager: CBLManager
    @State private var NewCBL = CBL(title: "", engage: Engage(), investigate: Investigate(), act: Act())
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Write your title", text: $NewCBL.title)
            }
        }
        .onDisappear {
            manager.manager.append(NewCBL)
            CBLManager.save(CBLManager: manager.manager) { result in
                if case .failure(let error) = result {
                    fatalError(error.localizedDescription)
                }
                print(manager.manager)
                print(CBLManager().manager)
            }
        }
    }
}

struct CBLAdd_Previews: PreviewProvider {
    static var previews: some View {
        CBLAdd()
            .environmentObject(CBLManager())
    }
}
