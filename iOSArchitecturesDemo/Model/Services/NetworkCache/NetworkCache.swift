//
//  NetworkCache.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 05.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

class NetworkCache {
    
    static let shared = NetworkCache()

    private init () {}

    private var cache: [String: Any] = [:]

    func saveToCache(key: String, value: Any) {
      cache[key] = value
    }

    func getFromCache(key: String) -> Any? {
      cache[key]
    }
}
