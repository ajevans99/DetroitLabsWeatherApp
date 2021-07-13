//
//  CurrentWeatherView.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/11/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var viewModel: ViewModel

    init(appServices: AppServices) {
        let viewModel = ViewModel(appServices: appServices)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .error(let error):
                Text("An error occurred \(error.localizedDescription)")
            case .loading:
                Text("Loading")
            case .ready(let currentConditions):
                VStack(spacing: 4) {
                    AsyncImage(url: Endpoint.weatherIcon(for: currentConditions.icon), placeholder: { ProgressView() })
                        .frame(width: 100, height: 100)
                    Text("\(currentConditions.conditions.temp, specifier: "%.0f")°")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    Text(currentConditions.name)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }

            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 300)
        .padding()
        .background(Color.blue.cornerRadius(32))
        .shadow(radius: 8)
    }
}
