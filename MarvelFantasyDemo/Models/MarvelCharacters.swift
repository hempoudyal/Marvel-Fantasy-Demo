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
    var descriptionCharacter: String?
    var thumbnail: Thumbnail
   
}

struct Thumbnail: Codable {
    var extensionImg: String?
    var path: String?
    var imgURL: String?
}
