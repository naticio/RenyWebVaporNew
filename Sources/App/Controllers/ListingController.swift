import Fluent
import Vapor

struct ListingController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let listingsRoutes = routes.grouped("api", "listings")
        
        //create route to fetch json from SE
        
    }

    
}
