
//  Created by Nat-Serrano on 12/13/22.
//

import Vapor
import Fluent //to connect to the DB

final class Listing: Model {
    static let schema = "listings" //basically the table name
    
    @ID
    var id: UUID?
    
    @Field(key: "address")
    var address: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "photos")
    var photos: [String]
    
    init() {}
    
    //to initialize the db
    init(id: UUID? = nil, address: String, description: String, photos: [String]) {
        self.id = id
        self.address = address
        self.description = description
        self.photos = photos
    }
    

}

//to make acronym conform to CONTENT, and use it in Vapor
extension Listing: Content {}
