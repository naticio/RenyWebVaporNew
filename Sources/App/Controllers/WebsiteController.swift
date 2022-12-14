//
//  File.swift
//  
//
//  Created by Nat-Serrano on 12/13/22.
//
import Vapor

struct WebsiteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        
        routes.get(use: indexHandler)

    }
    
    //landing page
    func indexHandler(_ req: Request) throws -> EventLoopFuture<View> {
        
        var urlComponents = URLComponents(string: "https://streeteasydaily.s3.us-west-2.amazonaws.com/streeteasy1.json")

        urlComponents?.queryItems = []
        let url = urlComponents?.url
        
        if let url = url {
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            
            // Get URLSession
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                // Fancy simplified way
                if error == nil {
                    do {
                        if data != nil {
                            
                            let decodedResponse = try! JSONDecoder().decode([Listings].self, from: data!)
                        }
                    }
                }
            }
            
        }
        dataTask.resume()
        
        let context = IndexContext(title: "Homepage", listing: listings)
        //generate the view
        return req.view.render("index", context)
        
    }
    
}

//to hold the data for the index page
struct IndexContext: Encodable {
    let title: String
    let listings: [Listing]
}
