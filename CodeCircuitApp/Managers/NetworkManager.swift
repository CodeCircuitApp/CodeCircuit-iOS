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
    
    func getEvents(sizePerPage: Int, page: Int, completion: @escaping (Result<[Event], CCError>) -> Void) async {
        guard let url = URL(string: "http://localhost:3000/events?sizePerPage=\(sizePerPage)&page=\(page)") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.unexpectedResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                switch response.statusCode {
                case 400:
                    completion(.failure(.badRequest))
                case 500:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.unknown))
                }
                
                return
            }
            
            guard !data.isEmpty else {
                completion(.failure(.emptyData))
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let events = try decoder.decode([Event].self, from: data)
            
            completion(.success(events))
        } catch {
            if error is DecodingError {
                completion(.failure(.decodingError))
                return
            }
            if error is URLError {
                completion(.failure(.connectionFailure))
                return
            }
            completion(.failure(.unknown))
        }
    }
    
    func getAllEvents(completion: @escaping (Result<[Event], CCError>) -> Void) async {
        guard let url = URL(string: "http://192.168.0.194:3000/events") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.unexpectedResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                switch response.statusCode {
                case 400:
                    completion(.failure(.badRequest))
                case 500:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.unknown))
                }
                
                return
            }
            
            guard !data.isEmpty else {
                completion(.failure(.emptyData))
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let events = try decoder.decode([Event].self, from: data)
            
            completion(.success(events))
        } catch {
            if error is DecodingError {
                completion(.failure(.decodingError))
                return
            }
            if error is URLError {
                completion(.failure(.connectionFailure))
                return
            }
            completion(.failure(.unknown))
        }
    }
}

enum CCError: String, Error {
    case invalidUrl
    case unexpectedResponse
    case badRequest
    case serverError
    case emptyData
    case unknown
    case decodingError
    case connectionFailure
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "The URL you're trying to reach is invalid."
        case .unexpectedResponse:
            return "The server returned an unexpected response."
        case .badRequest:
            return "The request was malformed or invalid."
        case .serverError:
            return "The server encountered an error. Please try again later."
        case .emptyData:
            return "The server returned empty data."
        case .unknown:
            return "An unknown error occurred. Please try again."
        case .decodingError:
            return "There was an error decoding the data. Please try again."
        case .connectionFailure:
            return "Connection failed. Please check your internet connection."
        }
    }
}
