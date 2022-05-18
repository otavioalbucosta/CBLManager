//
//  InvestigateForm.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 17/05/22.
//

import SwiftUI

struct InvestigateForm: View {
    
    @Binding var investigate: Investigate
    @State private var newGuidingQuestion = GuidingQuestion()
    @State private var newIsExpanded = false
    
    @State private var isExpanded: [UUID: Bool] = [:]
    
    func binding(for question: GuidingQuestion) -> Binding<Bool> {
        Binding(
            get: {
                return isExpanded[question.id] ?? false
            },
            set: { value in
                isExpanded[question.id] = value
            }
        )
    }
    
    
    var body: some View {
            Form{
                Section(header: Text("Guiding Questions")){
                    List {
                        ForEach(investigate.guidingQuestions){ question in
                            DisclosureGroup(isExpanded: binding(for: question)){
                            VStack(alignment: .leading){
                                Text("Guiding Question")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    
                                TextEditor(text: $investigate.guidingQuestions.first(where: {$0.id == question.id})!.question)
                            }
                            .frame(alignment: .leading)
                            
                            VStack(alignment: .leading){
                                Text("Guiding Activity")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    
                                TextEditor(text: $investigate.guidingQuestions.first(where: {$0.id == question.id})!.guidingActivity)
                            }
                            .frame(alignment: .leading)
                            VStack(alignment: .leading){
                                Text("Resource")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    
                                TextEditor(text: $investigate.guidingQuestions.first(where: {$0.id == question.id})!.resource)
                            }
                            .frame(alignment: .leading)
                            } label: {
                                Label(investigate.guidingQuestions.first(where: {$0.id == question.id})!.question, systemImage: "lightbulb")
                                    .foregroundColor(Color("CardText"))
                            }
                        }
                        .onDelete { index in
                            investigate.guidingQuestions.remove(atOffsets: index)
                            
                        }
                        DisclosureGroup(isExpanded: $newIsExpanded){
                        VStack(alignment: .leading){
                            Text("Guiding Question")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                            TextEditor(text: $newGuidingQuestion.question)
                                .frame(width: 310, height: 37, alignment: .leading)
                                .padding(.top,-5)
                        }

                        
                        VStack(alignment: .leading){
                            Text("Guiding Activity")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                            TextEditor(text: $newGuidingQuestion.guidingActivity)
                                .frame(width: 310, height: 37, alignment: .leading)
                                .padding(.top,-5)
                        }

                        VStack(alignment: .leading){
                            Text("Resource")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                
                            TextEditor(text: $newGuidingQuestion.resource)
                                .frame(width: 310, height: 37, alignment: .leading)
                                .padding(.top,-5)
                        }
                        .frame(alignment: .leading)
                            HStack{
                                Spacer()
                                Text("Add")
                                Button(action: {
                                    if(newGuidingQuestion.question != ""){
                                        investigate.guidingQuestions.append(newGuidingQuestion)
                                        newGuidingQuestion = GuidingQuestion()
                                    }

                                    
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                }
                                .disabled(newGuidingQuestion.question == "")
                            }

                        } label: {
                            Label(newGuidingQuestion.question == "" ? "Click to add a new view" : newGuidingQuestion.question, systemImage: "plus.circle")
                        }
                            
                    }
                }
                Section(header:Text("Synthesis")){
                        TextEditor(text: $investigate.synthesis)
                            .frame(width: 310, height: 60, alignment: .leading)
                            .padding(.top,-5)

                }
            }
    }
}

struct InvestigateForm_Previews: PreviewProvider {
    static var previews: some View {
        InvestigateForm(investigate: .constant(CBLManager().manager[0].investigate))
    }
}
