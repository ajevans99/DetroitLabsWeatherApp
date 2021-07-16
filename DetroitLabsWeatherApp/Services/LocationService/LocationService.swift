//
//  LocationService.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import CoreLocation
import Combine

class LocationService: NSObject, CLLocationManagerDelegate {
    static let lastKnownLocationKey = "LastKnownLocation"
    static let defaultLocation = Location(latitude: 42.3314, longitude: -83.0458) // Coords of Detroit

    let locationManager: CLLocationManager
    /// A subject that wraps a location and publishes a new element whenever the value changes.
    private let locationPublisher: CurrentValueSubject<Location, WeatherError>
    var publisher: AnyPublisher<Location, WeatherError>

    override init() {
        let lastKnownLocation = UserDefaults.standard.location(forKey: LocationService.lastKnownLocationKey)

        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationPublisher = CurrentValueSubject<Location, WeatherError>(lastKnownLocation ?? LocationService.defaultLocation)
        publisher = locationPublisher.eraseToAnyPublisher()

        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = Location(locations.last!)
        locationPublisher.send(location)
        UserDefaults.standard.set(location, forKey: LocationService.lastKnownLocationKey)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to fetch user location: error \(error.localizedDescription)")
    }
}
