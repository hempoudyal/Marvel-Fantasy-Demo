//
//  WebService.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/10/21.
//

import Foundation
import CryptoSwift

struct WebConstants{
    static let publicKey = "5f0ca65b3e9d948497d204783202799a"
    static let privateKey = "62be2e26546335499263481e607c53f3427e3b82"
    
    static let kBaseURL = "https://gateway.marvel.com:443/v1/public/characters"
}

class WebService : NSObject{
    class func webRequest(_ apiRouter: API_Router,
                          parameters: [String: Any]? = nil,
                          successBlock:@escaping ((_ response:Data) -> Void),
                          failureBlock:@escaping ((_ message:String) -> Void)){
        
        //Timestamp and hashValue should have same time
        let ts = getTimeStamp()
        let hashString = ts + WebConstants.privateKey + WebConstants.publicKey
        let hashValue = hashString.md5()
        
        var param : [String : Any] = [
            "apikey": WebConstants.publicKey ,
            "ts": ts,
            "hash": hashValue]
        
        //Merge parameters
        if let reqParam = parameters {
            print(reqParam)
            param.update(other: reqParam)
        }
        
        let router = API_Router.path(apiRouter)()
        var urlComps = URLComponents(string: router.url)
        urlComps?.queryItemsDictionary = param
        
        //Setup the HTTP request with URL Session
        let session = URLSession.shared
        let url = urlComps?.url!
        
        //Make the request with URLSessionDataTask
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                failureBlock("HTTP response failed")
                print(error.debugDescription)
            }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else{
                failureBlock("Server error")
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            //send data in success block - a closure
            successBlock(data!)
        }
        
        task.resume()
        
    }
}


