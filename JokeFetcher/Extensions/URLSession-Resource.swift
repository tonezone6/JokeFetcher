//
//  URLSession-Joke.swift
//  JokeFetcher
//
//  Created by Alex Stratu on 18.03.2021.
//

import Combine
import CombineExtensions
import Foundation

extension URLSession {
    
    func load<T: Decodable>(
        resource: T.Type,
        decoder: JSONDecoder = .init(),
        with request: URLRequest,
        retry count: Int = 0) -> AnyPublisher<T, Joke.Error> {
        
        dataTaskPublisher(for: request)
            .retry(count)
            .map(\.data)
            .tryDecodeFailure(type: Joke.Failure.self, decoder: decoder)
            .decode(type: T.self, decoder: decoder)
            .mapError(jokeError)
            .eraseToAnyPublisher()
    }
    
    func jokeError(with error: Error) -> Joke.Error {
        switch error {
        case is URLError:
            return .network
        case is DecodingError:
            return .parsing
        case is Joke.Failure:
            return .failure(error as! Joke.Failure)
        default:
            return .unknown
        }
    }
}
