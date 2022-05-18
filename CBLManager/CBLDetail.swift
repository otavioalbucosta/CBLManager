//
//  SwiftUIView.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 14/05/22.
//

import SwiftUI

struct CBLDetail: View {
    @State private var isExpanded : Bool = false
    var CBL: CBL
    var sysImage: String
    var labelname: String

    var desc: String
    var body: some View {
        VStack {
            HStack {
        
                Label(labelname, systemImage: sysImage)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(.blue)

                Spacer()
            }
            Text(desc)
            .font(.body)
            .multilineTextAlignment(.leading)
            .transition(.move(edge: .leading).animation(.linear))
            .overlay(
              GeometryReader { proxy in
                Button(action: {
                  isExpanded.toggle()
                }) {
                  Text(isExpanded ? "read less...": "read more...")
                }
                .frame(width: proxy.size.width-5, height: proxy.size.height+20, alignment: .bottomTrailing)
                
              }
            )


        }
        .frame(height: isExpanded ? 300 : 150, alignment: .leading)

        .padding()
    }
}

struct CBLDetail_Previews: PreviewProvider {
    static var previews: some View {
      CBLDetail(CBL: CBLManager().mock[0],sysImage: "lightbulb", labelname: "Engage", desc: Engage.desc)
        .previewLayout(.fixed(width: 390, height: 300))
      CBLDetail(CBL: CBLManager().mock[1],sysImage: "magnifyingglass", labelname: "Investigate", desc: Investigate.desc)
    }
}
