//
//  DetroitLabsWeatherApp.swift
//  DetroitLabsWeatherApp
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI

@main
struct DetroitLabsWeatherApp: App {
    let appServices = AppServices()

    var body: some Scene {
        WindowGroup {
            ContentView(appServices: appServices)
        }
    }
}
