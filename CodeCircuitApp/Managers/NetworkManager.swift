//
//  NetworkManager.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 20/03/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getAllEvents(completion: @escaping (Result<[Event], CCError>) -> Void) async {
        guard let url = URL(string: "http://localhost:3000/events") else {
            completion(.failure(.badURL))
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(.badRequest))
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let events = try decoder.decode([Event].self, from: data)
            
            completion(.success(events))
        } catch {
            print(error)
            completion(.failure(.unknown))
        }
    }
}

enum CCError: String, Error {
    case badURL = "Bad URL"
    case badRequest = "Bad request"
    case unknown = "Unknown error"
}
