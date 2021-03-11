//
//  WebService.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/10/21.
//

import Foundation
import Alamofire

//06022F
enum networkStatus: Int{
    case success = 200
    case created = 201
    case noContent = 204
    case failure = 422
    case badRequest = 400
    case unAuthorized = 401
    case notFound = 404
    case methodNotAllowed = 405
    
    //continue research
    func successCheck() -> Bool {
        switch self.rawValue {
        case 200..<300:
            return true
        case 400..<500:
            return false
        default:
            return true
        }
    }
}

class WebService : NSObject{
    class func webRequest(_ apiRouter: API_Router,
                          parameters: [String: Any]? = nil,
                          successBlock:@escaping ((_ response: [String: AnyObject]) -> Void),
                          failureBlock:@escaping ((_ message:String) -> Void)){
        
    }
}
