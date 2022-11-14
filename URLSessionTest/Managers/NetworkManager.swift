//
//  NetworkManager.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 9.11.22.
//

import Foundation
import Alamofire


enum Link: String {
    case disneyCharactersURL = "https://api.disneyapi.dev/characters"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacters(from url: String, completion: @escaping(Result<[Character], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let value = value as? [String: Any] else { return }
                    let charactersData = CharactersData.getData(from: value)
                    let characters = Character.getCharacters(from: charactersData.data)
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                    print(error)
            }
    }
}

    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    print(error)
                }
            }
    }
}
