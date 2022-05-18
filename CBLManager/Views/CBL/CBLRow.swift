//
//  CBLRoq.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 16/05/22.
//

import SwiftUI

struct CBLRow: View {
    var CBL: CBL
    var body: some View {
        NavigationLink{
            CBLView(CBL:CBL)
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                    Text(CBL.title.prefix(1))
                        .font(.system(size: 30))
                }
                .frame(width: 60, height: 60, alignment: .leading)
                Text(CBL.title)
                    .font(.title2)
            }
            .padding()
        }
        
    }
}

struct CBLRow_Previews: PreviewProvider {
    static var previews: some View {
        CBLRow(CBL: CBLManager().manager[0])
    }
}
