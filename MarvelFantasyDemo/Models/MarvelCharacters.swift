//
//  MarvelCharacters.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/12/21.
//

import Foundation
import UIKit


struct MarvelCharacter: Codable {
    var id: Int
    var name: String
    var description: String? = ""
    var thumbnail: Thumbnail
    var stories: Stories?
}

struct Thumbnail: Codable {
    var extensionImg: String?
    var path: String?
    
    enum CodingKeys: String, CodingKey{
        case extensionImg = "extension"
        case path = "path"
    }
}
