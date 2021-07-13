//
//  CurrentWeatherView+ViewModel.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import SwiftUI
import Combine

extension CurrentWeatherView {
    class ViewModel: ObservableObject {
        enum State {
            case loading
            case error(Error)
            case ready(CurrentConditions)
        }

        private let appServices: AppServices
        private var cancellables = Set<AnyCancellable>()

        @Published var state = State.loading

        init(appServices: AppServices) {
            self.appServices = appServices

            fetchWeather()
        }

        func fetchWeather() {
            appServices.weatherService.getCurrentConditions(for: Location(latitude: 42.3314, longitude: -83.0458))
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { [weak self] result in
                    switch result {
                    case .failure(let error):
                        self?.state = .error(error)
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] currentConditions in
                    print(currentConditions)
                    self?.state = .ready(currentConditions)
                })
                .store(in: &cancellables)
        }
    }
}
