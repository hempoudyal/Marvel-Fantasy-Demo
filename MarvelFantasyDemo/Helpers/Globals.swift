//
//  Globals.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/12/21.
//

import UIKit

func getTimeStamp() -> String{
    let timestamp = String(NSDate().timeIntervalSince1970)
    return timestamp
}

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

extension URLComponents{
    var queryItemsDictionary : [String:Any]{
        set (queryItemsDictionary){
            self.queryItems = queryItemsDictionary.map {
                URLQueryItem(name: $0, value: "\($1)")
            }
        }
        get{
            var params = [String: Any]()
            return queryItems?.reduce([:], { (_, item) -> [String: Any] in
                params[item.name] = item.value
                return params
            }) ?? [:]
        }
    }
}

func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

func alertUser(viewController: UIViewController, title: String, message: String) {
    let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        print("Ok button tapped")
     })
    dialogMessage.addAction(ok)
    // Present alert to user
    viewController.present(dialogMessage, animated: true, completion: nil)
}
