//
//  API_Router.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/10/21.
//

import Foundation
import Alamofire

struct API_Request{
    var url: String
    var method: HTTPMethod
}

enum API_Router{
    case getCharacters
    case events(id: String)
}

extension API_Router{
    func path() -> API_Request{
        switch self {
        case .getCharacters:
            return API_Request(url: WebConstants.kBaseURL, method: .get)
        case .events (let id):
            return API_Request(url: WebConstants.kBaseURL + "/" + id + "/events", method: .get)
        }
    }
        
}
