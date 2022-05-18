//
//  CBLView.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 17/05/22.
//

import SwiftUI

struct CBLView: View {
    var CBL: CBL
    var body: some View {
        List {
            EngageRow(CBL: CBL)
            InvestigateRow(CBL: CBL)
        }
    }
}

struct CBLView_Previews: PreviewProvider {
    static var previews: some View {
        CBLView(CBL: CBLManager().manager[0])
    }
}
