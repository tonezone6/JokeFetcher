//
//  AlertView.swift
//

import SwiftUI

struct AlertView: View {
    let message: String
    let retry: (() -> Void)?
    @State private var show = false
    
    init(message: String, retry: (() -> Void)? = nil) {
        self.message = message
        self.retry = retry
    }
        
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea(.all)
            
            if let action = retry {
                Button(action: action) {
                    Text("Retry")
                        .padding()
                        .font(.headline)
                        .background(Color.white)
                        .cornerRadius(8)
                }
            }
        }
        .alert(isPresented: $show) {
            Alert(
                title: Text("Alert"),
                message: Text(message),
                dismissButton: .cancel()
            )
        }
        .onAppear {
            show = true
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(message: "message")
    }
}
