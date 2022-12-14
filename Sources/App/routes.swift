import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    //refers to te collection of routes in controllers folder
    let listingController = ListingController()
    try app.register(collection: listingController)
    
    let websiteController = WebsiteController()
    try app.register(collection: websiteController)
    
}
