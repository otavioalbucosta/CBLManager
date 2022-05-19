//
//  EngageForm.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 17/05/22.
//

import SwiftUI

struct EngageForm: View {
    @Binding var engage: Engage

    
    var body: some View {
            Form{
                Section(header: Text("BigIdea")){
                    TextEditor( text: $engage.bigIdea)
                        .frame(minHeight: 60, alignment: .leading)
                    
                }
                Section(header:Text("Essential Question")){
                    TextEditor(text: $engage.essentialQuestion)
                        .frame(minHeight: 60, alignment: .leading)
                }
                
                Section(header:Text("Challenge")){
                    TextEditor(text: $engage.challenge)
                        .frame(minHeight: 60, alignment: .leading)
                }
            }
            
        
    }
}

struct EngageForm_Previews: PreviewProvider {
    static var previews: some View {
        EngageForm(engage: .constant(Engage.mock))
    }
}
