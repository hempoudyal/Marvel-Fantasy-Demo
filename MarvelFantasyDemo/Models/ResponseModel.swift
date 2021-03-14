//
//  ResponseModel.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

struct Response: Codable{
    let status: String
    let data : ResponseData
}

struct ResponseData: Codable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelCharacter]
}

struct ResponseComic: Codable{
    let status: String
    let data: ResponseComicData
}

struct ResponseComicData: Codable{
    let count: Int
    let results: [Comic]
}
