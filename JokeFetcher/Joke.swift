//
//  Joke.swift
//

struct Joke: Decodable {
    let id: String
    let joke: String
}

// Custom error.

extension Joke {
    struct Failure: Swift.Error, Decodable {
        let message: String
        let status: Int
    }
    
    enum Error: Swift.Error, CustomStringConvertible {
        case network
        case parsing
        case failure(Failure)
        case unknown
        
        var description: String {
            switch self {
            case .failure(let error):
                return error.message
            case .network: return "Request failed"
            case .parsing: return "Failed parsing response from server"
            case .unknown: return "An unknown error occurred"
            }
        }
    }
}

extension Joke.Error: Identifiable {
    var id: String { description }
}

