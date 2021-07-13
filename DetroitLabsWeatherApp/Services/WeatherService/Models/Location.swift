//
//  Location.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import CoreLocation

struct Location: Codable {
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    init(_ location: CLLocation) {
        let coordinate = location.coordinate
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
}

extension UserDefaults {
    func location(forKey: String) -> Location? {
        guard let data = data(forKey: forKey) else { return nil }
        return try? JSONDecoder().decode(Location.self, from: data)
    }

    func set(_ value: Location, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
}
