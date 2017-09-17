//
//  RestApiManager.swift
//  hackMIT
//
//  Created by Hannah Chen on 9/16/17.
//  Copyright © 2017 Hannah Chen. All rights reserved.
//

import SwiftyJSON
import Foundation

typealias ServiceResponse = (JSON, Error?) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    let baseURL = "https://www.googleapis.com/customsearch/"
    
    func getFoodImage(url: String, onCompletion: @escaping (JSON) -> Void) {
        let route = baseURL + url
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = URLRequest(url: URL(string: path)!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
            do{
                let jsonData = data
//                try print(JSON(data: jsonData!))
                try onCompletion(JSON(data: jsonData!), error)
            } catch{
                onCompletion(JSON.null, error)
            }
//            if let jsonData = data {
//                let json:JSON = JSON(data: jsonData)
//                onCompletion(json, error)
//            } else {
//                onCompletion(JSON.null, error)
//            }
        })
        task.resume()
    }
    
//    // MARK: Perform a POST Request
//    private func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: ServiceResponse) {
//        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
//        
//        // Set the method to POST
//        request.HTTPMethod = "POST"
//        
//        do {
//            // Set the POST body for the request
//            let jsonBody = try NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
//            request.HTTPBody = jsonBody
//            let session = NSURLSession.sharedSession()
//            
//            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//                if let jsonData = data {
//                    let json:JSON = JSON(data: jsonData)
//                    onCompletion(json, nil)
//                } else {
//                    onCompletion(nil, error)
//                }
//            })
//            task.resume()
//        } catch {
//            // Create your personal error
//            onCompletion(nil, nil)
//        }
//    }
}
