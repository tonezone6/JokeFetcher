//
//  URLRequest-Joke.swift
//  JokeFetcher
//
//  Created by Alex Stratu on 18.03.2021.
//

import Foundation

extension URLRequest {
    
    static func joke(with id: String) -> URLRequest {
        let base = URL(string: "https://icanhazdadjoke.com/j")!
        let url = base.appendingPathComponent(id)

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Accept" : "application/json"]
        return request
    }
}
