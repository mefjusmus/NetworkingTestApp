//
//  Animal.swift
//  URLSessionTest
//
//  Created by Vladislav Suslov on 7.11.22.
//

import Foundation

struct Characters: Decodable {
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case characters = "data"
    }
}

struct Character: Decodable {
    let films, shortFilms, tvShows, videoGames: [String]
    let name: String
    let imageURL: String
    
    var description: String {
        """
        Films: \(films.joined(separator: ", "))
        ShortFilms: \(shortFilms.joined(separator: ", "))
        TVShows: \(tvShows.joined(separator: ", "))
        VideoGames: \(videoGames.joined(separator: ", "))
        """
    }
    
    enum CodingKeys: String, CodingKey {
        case films, shortFilms, tvShows, videoGames
        case name = "name"
        case imageURL = "imageUrl"
    }
}


