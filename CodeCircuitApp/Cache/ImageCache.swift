//
//  ImageCache.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 14/06/2025.
//

import Foundation

class ImageCache {
    typealias CacheType = NSCache<NSString, NSData>
    
    static let shared = ImageCache()
    
    private init() {}
    
    private lazy var cache: CacheType = {
        let cache = CacheType()
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024 // 50MB
        return cache
    }()
    
    func object(forKey key: NSString) -> Data? {
        cache.object(forKey: key) as? Data
    }
    
    func set(object: NSData, forKey key: NSString) {
        cache.setObject(object, forKey: key)
    }
}
