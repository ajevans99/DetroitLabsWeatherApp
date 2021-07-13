//
//  AppServices.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation

class AppServices {
    let weatherService = WeatherService(apiKey: ConfigEnvironment.openWeatherAPIKey)
}
