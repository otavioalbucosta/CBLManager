//
//  CBLModel.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 13/05/22.


import Foundation


struct CBL: Identifiable,Hashable,Codable {
    var id: UUID
    var title: String
    var tags: [String] = []
    var engage: Engage
    var investigate: Investigate
    var act: Act
    
    init(title: String = "", engage: Engage = Engage(), investigate: Investigate =  Investigate(), act: Act = Act()) {
        self.id = UUID()
        self.title = title
        self.engage = engage
        self.investigate = investigate
        self.act = act
    }
}



