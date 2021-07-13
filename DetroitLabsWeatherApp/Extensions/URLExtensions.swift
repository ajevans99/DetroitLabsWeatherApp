//
//  URLExtensions.swift
//  
//
//  Created by Austin Evans on 7/11/21.
//

import Foundation

extension URL {
    private func appending(queryItem: URLQueryItem) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        var queryItems = components?.queryItems ?? []
        queryItems.append(queryItem)
        components?.queryItems = queryItems
        return components?.url ?? self
    }

    func appendingQueryItem<T>(name: String, value: T?) -> URL {
        guard let value = value else { return self }
        return appending(queryItem: URLQueryItem(name: name, value: "\(value)"))
    }

    func appendingDirPath(_ path: String) -> URL {
        appendingPathComponent(path, isDirectory: true)
    }
}
