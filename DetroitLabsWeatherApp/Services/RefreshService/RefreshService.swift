//
//  RefreshService.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import CoreLocation
import Combine

/// Service to hold publisher that emmits at `secondsToRefresh` intervals for automatic
/// refreshing of weather information
class RefreshService {
    static let secondsToRefresh: TimeInterval = 120

    private var manualRefreshPublisher = PassthroughSubject<Date, Never>()
    let publisher: AnyPublisher<Date, WeatherError>

    init() {
        publisher = Timer
            .publish(every: RefreshService.secondsToRefresh, on: .current, in: .default)
            .autoconnect()
            .merge(with: Just(Date()))      // Publish on subscribe immediately
            .merge(with: manualRefreshPublisher)
            .mapToWeatherError()
            .eraseToAnyPublisher()
    }

    func refresh() {
        manualRefreshPublisher.send(Date())
    }
}
