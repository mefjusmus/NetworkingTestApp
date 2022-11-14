//
//  Animal.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 7.11.22.
//

import Foundation

struct CharactersData {
    let data: [[String: Any]]
    
    init(charactersData: [String : Any]) {
        self.data = charactersData["data"] as? [[String: Any]] ?? []
    }
    
    static func getData(from value: [String: Any]) -> CharactersData {
        CharactersData(charactersData: value)
    }
}

struct Character {
    let name: String
    let imageURL: String
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    
    var description: String {
           """
           Films: \(films.joined(separator: ", "))
           ShortFilms: \(shortFilms.joined(separator: ", "))
           TVShows: \(tvShows.joined(separator: ", "))
           VideoGames: \(videoGames.joined(separator: ", "))
           """
    }
    
    init(name: String, imageURL: String, films: [String], shortFilms: [String], tvShows: [String], videoGames: [String]) {
        self.name = name
        self.imageURL = imageURL
        self.films = films
        self.shortFilms = shortFilms
        self.tvShows = tvShows
        self.videoGames = videoGames
    }
    
    init(characterData: [String : Any]) {
        name = characterData["name"] as? String ?? ""
        imageURL = characterData["imageUrl"] as? String ?? ""
        films = characterData["films"] as? [String] ?? []
        shortFilms = characterData["shortFilms"] as? [String] ?? []
        tvShows = characterData["tvShows"] as? [String] ?? []
        videoGames = characterData["videoGames"] as? [String] ?? []
    }
    
    
    static func getCharacters(from charactersData: [[String: Any]]) -> [Character] {
        var characters: [Character] = []
        charactersData.forEach { character in
            characters.append(Character(characterData: character))
        }
        return characters
    }
}



