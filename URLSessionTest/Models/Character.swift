//
//  Animal.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 7.11.22.
//

import Foundation

struct Character {
    let name: String
    let imageURL: String
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    
    init(characterData: [String : Any]) {
        name = characterData["name"] as? String ?? ""
        imageURL = characterData["imageUrl"] as? String ?? ""
        films = characterData["films"] as? [String] ?? []
        shortFilms = characterData["shortFilms"] as? [String] ?? []
        tvShows = characterData["tvShows"] as? [String] ?? []
        videoGames = characterData["videoGames"] as? [String] ?? []
    }
    
    
    static func getCharacters(from charactersData: Any) -> [Character] {
        guard let charactersData = charactersData as? [String: Any] else { return [] }
        let data = charactersData["data"] as? [[String: Any]] ?? []
        var characters: [Character] = []
        data.forEach {
            let character = Character(characterData: $0)
            characters.append(character)
        }
        return characters
    }
}



