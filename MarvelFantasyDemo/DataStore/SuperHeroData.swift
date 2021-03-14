//
//  SuperHeroData.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/12/21.
//

struct SuperHeroData {
    
    static let heroCharacters = [ MarvelCharacter(id: 1, name: "Hulk", thumbnail:   thumbnails[0]),
                              MarvelCharacter(id: 2, name: "Thanos", thumbnail: thumbnails[1]),
                              MarvelCharacter(id: 2, name: "Spider-Man", thumbnail: thumbnails[2]),
                              MarvelCharacter(id: 2, name: "Iron Man", thumbnail: thumbnails[3])
    ]
    
    static let thumbnails = [ Thumbnail(path: "Hulk"),
                              Thumbnail(path: "Thanos"),
                              Thumbnail(path: "SpiderMan"),
                              Thumbnail(path: "IronMan")]

}
