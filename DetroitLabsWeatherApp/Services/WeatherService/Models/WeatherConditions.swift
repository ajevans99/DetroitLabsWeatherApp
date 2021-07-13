//
//  WeatherConditions.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import Foundation

struct WeatherConditions: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
}

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
    let gust: Double?
}
