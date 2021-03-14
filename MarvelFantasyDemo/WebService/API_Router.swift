//
//  API_Router.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/10/21.
//

import Foundation

struct API_Request{
    var url: String
    //only url is taken for Marvel Api, since it has just .get method
    //other authorization values can also be set
}

enum API_Router{
    case getCharacters
    case events(id: String)
    case comics(id: String)
}

extension API_Router{
    func path() -> API_Request{
        switch self {
        case .getCharacters:
            return API_Request(url: WebConstants.kBaseURL)
        case .events (let id):
            return API_Request(url: WebConstants.kBaseURL + "/" + id + "/events")
        case .comics(let id):
            return API_Request(url: WebConstants.kBaseURL + "/" + id + "/comics")
        }
    }
        
}
