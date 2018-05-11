import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("api", "acronyms", "sorted") { (req) -> Future<[Acronym]> in
        return try Acronym.query(on: req)
            .sort(\.short, .ascending)
            .all()
    }
    
    let acronymsController = AcronymsController()
    try router.register(collection: acronymsController)
}
