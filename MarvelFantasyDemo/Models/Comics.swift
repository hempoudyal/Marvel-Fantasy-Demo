//
//  Comics.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/14/21.
//

struct Comic: Codable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail
    let urls: [linkURL]
}

struct linkURL: Codable{
    let type: String
    let url: String
}
