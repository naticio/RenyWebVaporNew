import Fluent

struct CreateListing: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        //what schema to use
        database.schema("listings")
            .id()
            .field("address", .string, .required)
            .field("description", .string, .required)
            .field("photos", .string, .required) //link to the user schema
            .create()
        
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("acronyms").delete() //wtf is this for? to delete the db?

    }
}
