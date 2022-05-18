//
//  Investigate.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 15/05/22.
//

import Foundation


struct Investigate: Codable,Hashable {
    var guidingQuestions: [GuidingQuestion] = []
    var synthesis: String
    
    init(synthesis: String, guidingQuestion: GuidingQuestion){
        self.synthesis = synthesis
        self.guidingQuestions.append(guidingQuestion)
    }
    init(synthesis: String, guidingQuestion: [GuidingQuestion]){
        self.synthesis = synthesis
        self.guidingQuestions = guidingQuestion
    }
    
    
}

struct GuidingQuestion: Codable, Hashable, Identifiable{
    var id: UUID
    var question: String
    var guidingActivity: String
    var resource: String
    

    init(question:String = "", guidingActivity: String = "", resource: String = ""){
        self.id = UUID()
        self.question = question
        self.guidingActivity = guidingActivity
        self.resource = resource
    }
}

extension GuidingQuestion {
    static var mock = [
        GuidingQuestion(
        question: "O que são views",
        guidingActivity: "Pesquisar na documentação",
        resource: "https://developer.apple.com/documentation/swiftui/"),
        GuidingQuestion(
        question: "O que são views",
        guidingActivity: "Pesquisar na documentação",
        resource: "https://developer.apple.com/documentation/swiftui/"),
    ]
}
extension Investigate{
    static var mock = Investigate(
        synthesis: "Aprendi que views são formas de compactar os componentes da tela",
        guidingQuestion: GuidingQuestion.mock)
    
    static var desc: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elementum augue quis neque mattis, id egestas elit aliquam. Integer euismod porttitor tortor, sit amet commodo eros molestie nec. Nullam tincidunt, metus in fermentum gravida, orci augue feugiat lectus, ut malesuada neque ipsum vel erat."
    static var icon: String = "magnifyingglass"
}
