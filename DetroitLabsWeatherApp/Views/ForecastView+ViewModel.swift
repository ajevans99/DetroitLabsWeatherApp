//
//  ForecastView+ViewModel.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI
import Combine

extension ForecastView {
    class ViewModel: ObservableObject {
        enum State {
            case loading
            case error(Error)
            case ready(Forecast)
        }

        private let appServices: AppServices
        private var cancellables = Set<AnyCancellable>()

        @Published var state = State.loading

        init(appServices: AppServices) {
            self.appServices = appServices

            fetchWeather()
        }

        func fetchWeather() {
            appServices.locationService.publisher
                .flatMap(appServices.weatherService.getForcast)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { [weak self] result in
                    switch result {
                    case .failure(let error):
                        self?.state = .error(error)
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] forecast in
                    self?.state = .ready(forecast)
                })
                .store(in: &cancellables)
        }
    }
}
