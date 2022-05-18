//
//  CBLModel.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 13/05/22.
//

import Foundation


struct CBL: Identifiable,Hashable,Codable {
    var id: UUID
    var title: String
    var engage: Engage
    var investigate: Investigate
    var act: Act
    init(id: UUID = UUID(),title: String, engage: Engage, investigate: Investigate, act: Act) {
        self.id = id
        self.title = title
        self.engage = engage
        self.investigate = investigate
        self.act = act
    }
}



