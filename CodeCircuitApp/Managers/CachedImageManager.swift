//
//  CachedImageManager.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 14/06/2025.
//

import Foundation

@Observable class CachedImageManager {
    private(set) var currentState: CurrentState?
    
    @MainActor
    func load(_ imgUrl: URL, cache: ImageCache = .shared) async {
        self.currentState = .loading
        
        if let imageData = cache.object(forKey: imgUrl.absoluteString as NSString) {
            self.currentState = .success(data: imageData)
            return
        }
        
        do {
            let data = try await NetworkManager.shared.retrieveImage(imgUrl)
            self.currentState = .success(data: data)
            cache.set(object: data as NSData, forKey: imgUrl.absoluteString as NSString)
        } catch {
            self.currentState = .failed(error: error)
            print(error)
        }
    }
}

extension CachedImageManager {
    enum CurrentState {
        case loading
        case failed(error: Error)
        case success(data: Data)
    }
}
