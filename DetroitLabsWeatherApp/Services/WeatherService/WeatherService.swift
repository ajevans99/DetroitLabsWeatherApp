//
//  WeatherService.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import Combine

class WeatherService {
    private let apiManager: APIManager

    init(apiKey: String) {
        apiManager = APIManager(apiKey: apiKey)
    }

    func getCurrentConditions(for location: Location) -> AnyPublisher<CurrentConditions, WeatherError> {
        apiManager.getWeather(with: Endpoint.currentWeather(for: location))
    }

    func getForcast(for location: Location) -> AnyPublisher<Forecast, WeatherError> {
        apiManager.getWeather(with: Endpoint.forcastUrl(for: location))
    }
}
