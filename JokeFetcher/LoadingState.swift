//
//  LoadingState.swift
//

enum LoadingState {
    case progress
    case success(Joke)
    case failure(Joke.Error)
}
