//
//  FetchController.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/23/23.
//

import Foundation

struct FetchController {
    enum NeworkError: Error {
        case badURL, badResponse
    }

    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!

    func fetchQuote(from show: String) async throws -> Quote {
        let characterURL = baseURL.appending(
            path: "quotes/random"
        )
        return try await doApiFetch(characterURL,
                                    qsDict: [
                                        "production": show,
                                    ],
                                    type: Quote.self)
    }

    func fetchCharacter(_ name: String) async throws -> Character {
        let characterURL = baseURL.appending(
            path: "characters"
        )
        let characters = try await doApiFetch(characterURL,
                                              qsDict: [
                                                  "name": name,
                                              ],
                                              type: [Character].self)
        return characters[0]
    }

    private func doApiFetch<T: Decodable>(_ url: URL, qsDict: [String: String], type: T.Type) async throws -> T {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var queryItems = [URLQueryItem]()
        for (key, value) in qsDict {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents?.queryItems = queryItems

        guard let fetchURL = urlComponents?.url else {
            throw NeworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: fetchURL)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NeworkError.badResponse
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }

//    func fetchQuote(from show: String) async throws -> Quote {
//        let quoteURL = baseURL.appending(path: "quotes/random")
//        var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
//        let quoteQueryItem = URLQueryItem(name: "production", value: show.replaceSpaceWithPlus)
//        quoteComponents?.queryItems = [quoteQueryItem]
//
//        guard let fetchURL = quoteComponents?.url else {
//            throw NeworkError.badURL
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: fetchURL)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw NeworkError.badResponse
//        }
//
//        return try JSONDecoder().decode(Quote.self, from: data)
//    }
//    func fetchCharacter(_ name: String) async throws -> Character {
//        let characterURL = baseURL.appending(path: "characters")
//        var characterComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
//        let characterQueryItem = URLQueryItem(name: "name", value: name.replaceSpaceWithPlus)
//        characterComponents?.queryItems = [characterQueryItem]
//
//        guard let fetchURL = characterComponents?.url else {
//            throw NeworkError.badURL
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: fetchURL)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw NeworkError.badResponse
//        }
//
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let characters = try decoder.decode([Character].self, from: data)
//        return characters[0]
//    }
}
