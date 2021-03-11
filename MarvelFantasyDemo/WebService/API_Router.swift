//
//  API_Router.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/10/21.
//

import Foundation

struct API_Request{
    var url: String
    var isAuthRequired: Bool
    //var method: HTTPMethod
}

struct APIConstants{
    
}

enum API_Router{
    case events
}

extension API_Router{
    func path() -> API_Request{
        switch self {
        case .events:
            return API_Request(url: "a", isAuthRequired: true)
        }
    }
        
}
