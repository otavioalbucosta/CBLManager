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
                    
                }
                Section(header:Text("Essential Question")){
                    TextEditor(text: $engage.essentialQuestion)
                }
                
                Section(header:Text("Challenge")){
                    TextEditor(text: $engage.challenge)
                }
            }
            
        
    }
}

struct EngageForm_Previews: PreviewProvider {
    static var previews: some View {
        EngageForm(engage: .constant(Engage.mock))
    }
}
