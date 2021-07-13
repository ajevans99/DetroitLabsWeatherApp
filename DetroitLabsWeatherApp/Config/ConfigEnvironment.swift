//
//  Environment.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation

enum ConfigEnvironment {
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  static let openWeatherAPIKey: String = {
    guard let apiKey = ConfigEnvironment.infoDictionary["Open Weather API Key"] as? String else {
      fatalError("Open Weather API key not set")
    }
    return apiKey
  }()
}
