//
//  CurrentConditions.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import SwiftUI

struct CurrentConditions: Codable {
    let date: Date
    let weather: [Weather]
    let conditions: WeatherConditions
    let visibility: Int
    let wind: Wind
    let name: String

    var icon: String {
        // Fallback to cloud icon if weather comes back empty
        weather.first?.icon ?? "03d"
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case weather, visibility, wind, name
        case conditions = "main"
    }
}
