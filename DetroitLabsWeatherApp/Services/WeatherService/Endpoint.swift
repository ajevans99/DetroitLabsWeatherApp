//
//  Endpoint.swift
//  
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation

struct Endpoint {
    static let baseUrl = URL(string: "https://api.openweathermap.org/data/2.5/")!
    static let imageUrl = URL(string: "https://openweathermap.org/img/wn/")!

    static let currentWeatherUrl = URL(string: "weather", relativeTo: baseUrl)!
    static let forecastUrl = URL(string: "forecast", relativeTo: baseUrl)!

    static func currentWeather(for location: Location) -> URL {
        currentWeatherUrl
            .appendingQueryItem(name: "units", value: "imperial")
            .appendingQueryItem(name: "lon", value: location.longitude)
            .appendingQueryItem(name: "lat", value: location.latitude)
    }

    static func forcastUrl(for location: Location) -> URL {
        forecastUrl
            .appendingQueryItem(name: "units", value: "imperial")
            .appendingQueryItem(name: "lon", value: location.longitude)
            .appendingQueryItem(name: "lat", value: location.latitude)
    }

    static func weatherIcon(for id: String) -> URL {
        URL(string: "\(id)@2x.png", relativeTo: imageUrl)!
    }
}
