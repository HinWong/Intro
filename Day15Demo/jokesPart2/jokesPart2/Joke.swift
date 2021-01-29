//
//  Joke.swift
//  jokesPart2
//
//  Created by Luat on 1/29/21.
//

import Foundation

struct Joke: Decodable {
    enum CodingKeys: String, CodingKey {
        case punchLine = "joke"
    }
    let punchLine: String
}
