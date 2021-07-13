//
//  APIManager.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import Combine

class APIManager {
    private let apiKey: String

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func makeRequest(to url: URL) -> URLSession.DataTaskPublisher {
        var request = URLRequest(url: url.appendingQueryItem(name: "appid", value: apiKey))
        request.httpMethod = "GET"
        return URLSession.shared.dataTaskPublisher(for: request)
    }

    func getWeather<T: Codable>(with url: URL) -> AnyPublisher<T, WeatherError> {
        makeRequest(to: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .print()
            .mapToWeatherError()
            .eraseToAnyPublisher()
    }
}
