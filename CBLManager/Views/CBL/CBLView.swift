//
//  CBLView.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 17/05/22.
//

import SwiftUI

struct CBLView: View {
    @EnvironmentObject var manager: CBLManager
    var CBL: CBL
    var body: some View {
        List {
            EngageRow(CBL: CBL).environmentObject(CBLManager())
            InvestigateRow(CBL: CBL).environmentObject(CBLManager())
            ActRow(CBL: CBL).environmentObject(CBLManager())
        }
        .onAppear {
            print(CBL.id)
            print(manager.manager)
        }
    }
}

struct CBLView_Previews: PreviewProvider {
    static var previews: some View {
        CBLView(CBL: CBLManager().manager[0])
            .environmentObject(CBLManager())
    }
}
