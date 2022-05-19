//
//  Act.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 15/05/22.
//

import Foundation

struct Act: Codable,Hashable {
    var solution: String
    var implementation: String
    var evaluation: String
    
    init(solution:String = "",implementation: String = "", evaluation: String = ""){
        self.solution = solution
        self.implementation = implementation
        self.evaluation = evaluation
    }
}

extension Act{
    static var mock = Act(
        solution: "App Gerenciador de CBL",
        implementation: "O App foi implementado em SWiftUI com mais de duas telas",
        evaluation: "O App foi de fundamental importancia para me ajudar a aprender SwiftUI e ajudar a documentar meus CBLs")
    
    static var desc: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elementum augue quis neque mattis, id egestas elit aliquam. Integer euismod porttitor tortor, sit amet commodo eros molestie nec. Nullam tincidunt, metus in fermentum gravida, orci augue feugiat lectus, ut malesuada neque ipsum vel erat."
    static var icon: String = "screwdriver"
}

