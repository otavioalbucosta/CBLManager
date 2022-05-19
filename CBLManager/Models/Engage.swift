//
//  Engage.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 15/05/22.
//

import Foundation

struct Engage: Codable,Hashable {
    var bigIdea: String
    var essentialQuestion: String
    var challenge: String

    
    init(bigIdea: String = "", essentialQuestion: String = "", challenge: String = ""){
        self.bigIdea = bigIdea
        self.essentialQuestion = essentialQuestion
        self.challenge = challenge
    }
    
}

extension Engage {
    static var mock = Engage(
        bigIdea: "SwiftUI",
        essentialQuestion: "Como fazer um app em swift",
        challenge: "Criar um app em SwiftUI com no mínimo duas telas")
    
    static var desc: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elementum augue quis neque mattis, id egestas elit aliquam. Integer euismod porttitor tortor, sit amet commodo eros molestie nec. Nullam tincidunt, metus in fermentum gravida, orci augue feugiat lectus, ut malesuada neque ipsum vel erat."
    static var icon: String = "lightbulb"
}
