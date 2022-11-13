//
//  NetworkManager.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 9.11.22.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

enum Link: String {
    case disneyCharactersURL = "https://api.disneyapi.dev/characters"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func fetchImage(from url: String?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let imageURL = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    
    
    func fetch<T: Decodable>(_ type: T.Type, from url: String?, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch let error {
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }.resume()
    }
}
