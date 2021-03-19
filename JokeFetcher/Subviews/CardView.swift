//
//  CardView.swift
//

import SwiftUI

struct CardView: View {
    let text: String
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea(.all)
            
            Text(text)
                .frame(minWidth: .zero, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding()
                .font(.largeTitle)
                .background(Color.white)
                .cornerRadius(16)
                .padding()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(text: "Lorem ipsum")
    }
}
