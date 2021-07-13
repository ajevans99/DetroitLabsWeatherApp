//
//  WeatherError.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation
import Combine

enum WeatherError: Error {
    case unableToDecode
    case invalidRequest
    case invalidApiKey
    case pageNotFound
    case other(Error)
}

extension Publisher {
    func mapToWeatherError() -> Publishers.MapError<Self, WeatherError> {
        mapError { error in
            switch error {
            case is URLError: return error.toWeatherError
            case is DecodingError: return .unableToDecode
            default: return .other(error)
            }
        }
    }
}

extension Error {
    var toWeatherError: WeatherError {
        guard let errorCode = (self as? URLError)?.errorCode else {
            return .other(self)
        }
        switch errorCode {
        case 400: return .invalidRequest
        case 401: return .invalidApiKey
        case 404: return .pageNotFound
        default: return .other(self)
        }
    }
}
