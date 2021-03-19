//
//  State.swift
//

enum State {
    case progress
    case success(Joke)
    case failure(Joke.Error)
}
