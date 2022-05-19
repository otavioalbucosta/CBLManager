//
//  ActForm.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 18/05/22.
//

import SwiftUI

struct ActForm: View {
    @Binding var act: Act

    
    var body: some View {
            Form{
                Section(header: Text("Solution")){
                    TextEditor( text: $act.solution)
                        .frame(minHeight: 60, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                Section(header:Text("Implementation")){
                    TextEditor(text: $act.implementation)
                        .frame(minHeight: 60, alignment: .leading)
                }
                
                Section(header:Text("Evaluation")){
                    TextEditor(text: $act.evaluation)
                        .frame(minHeight: 60, alignment: .leading)
                }
            }
            
        
    }
}

struct ActForm_Previews: PreviewProvider {
    static var previews: some View {
        ActForm(act: .constant(CBLManager().manager[0].act))
    }
}
