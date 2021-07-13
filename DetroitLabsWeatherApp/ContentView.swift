//
//  ContentView.swift
//  DetroitLabsWeatherApp
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    let appServices: AppServices

    var body: some View {
        NavigationView {
            ScrollView {
                CurrentWeatherView(appServices: appServices)
                    .padding()
                ForecastView(appServices: appServices)
                    .padding()
            }
            .navigationTitle("Weather")
        }
    }
}
