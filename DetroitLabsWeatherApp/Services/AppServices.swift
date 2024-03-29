//
//  AppServices.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation

class AppServices {
    let refreshService = RefreshService()
    let locationService = LocationService()
    let weatherService = WeatherService(apiKey: ConfigEnvironment.openWeatherAPIKey)
}
