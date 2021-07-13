//
//  EnvironmentValues+ImageCache.swift
//  DetroitLabsWeather
//
//  Created by Austin Evans on 7/12/21.
//

import SwiftUI

// Source: https://github.com/V8tr/AsyncImage
struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
