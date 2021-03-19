//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @StateObject private var fetcher = JokeFetcher()
    
    var body: some View {
        VStack {
            switch fetcher.state {
            case .progress:
                ProgressView()
            case .success(let result):
                CardView(text: result.joke)
            case .failure(let error):
                AlertView(message: error.description)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
