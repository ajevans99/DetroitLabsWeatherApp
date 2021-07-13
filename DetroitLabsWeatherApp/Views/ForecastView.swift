//
//  ForecastView.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI

struct ForecastView: View {
    @StateObject var viewModel: ViewModel

    init(appServices: AppServices) {
        let viewModel = ViewModel(appServices: appServices)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .error:
                ErrorView()
            case .loading:
                Text("Loading")
            case .ready(let forecast):
                LazyVStack {
                    Text("Forecast")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding()
                    ForEach(forecast.sortedDateKeys, id: \.self) { day in
                        Text("\(forecast.conditionsByDay[day]![0].date, style: .date)")
                        HStack {
                            ForEach(forecast.conditionsByDay[day] ?? []) { conditions in
                                VStack {
                                    AsyncImage(url: Endpoint.weatherIcon(for: conditions.icon), placeholder: { ProgressView() }, image: { uiImage in Image(uiImage: uiImage).resizable() })
                                        .frame(width: 20, height: 20)
                                        .scaleEffect(1.7)
                                    Text("\(conditions.conditions.temp, specifier: "%.0f")")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                    Text("\(conditions.date, style: .time)")
                                        .font(.system(size: 7, weight: .bold, design: .rounded))
                                }
                            }
                        }
                        Divider()
                            .padding()
                    }
                }
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 300)
        .padding()
        .background(Color.green.cornerRadius(32).shadow(radius: 8))
    }
}
