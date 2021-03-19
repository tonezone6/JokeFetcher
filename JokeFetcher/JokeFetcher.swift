//
//  JokeFetcher.swift
//

import Combine
import Foundation

final class JokeFetcher: ObservableObject {
    @Published var state: LoadingState = .progress
    
    var subscription: Cancellable?
    
    init() {
        subscription = URLSession.shared
            .load(resource: Joke.self, with: .joke(with: "9prWnjyImyd"))
            .delay(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { .success($0) }
            .catch { error in
                Just(.failure(error))
            }
            .receive(on: DispatchQueue.main)
            .weakAssign(to: \.state, on: self)
    }
}
