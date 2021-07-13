//
//  Forecast.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import Foundation

struct Forecast: Codable {
    struct Conditions: Codable, Identifiable {
        let date: Date
        let conditions: WeatherConditions
        let weather: [Weather]
        let wind: Wind
        let id = UUID()

        var icon: String {
            // Fallback to cloud icon if weather comes back empty
            weather.first?.icon ?? "03d"
        }

        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case conditions = "main"
            case weather, wind
        }
    }

    let conditions: [Conditions]

    var conditionsByDay: [String: [Conditions]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return Dictionary(grouping: conditions) { element in
            dateFormatter.string(from: element.date)
        }
    }

    var sortedDateKeys: [String] {
        Array(conditionsByDay.keys.sorted().prefix(5))
    }

    enum CodingKeys: String, CodingKey {
        case conditions = "list"
    }
}
