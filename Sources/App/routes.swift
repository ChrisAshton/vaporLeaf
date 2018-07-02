import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get("name") { req in
        return "Ethan Hunt"
        
    }
    
    router.get("age") { req in
        return "\(23)"
    }
    
    router.get("json") { req in
        return Person(name: "George Foreman", age: 26)
    }
}

// Important: Your class or struct conforms to Content
struct Person: Content {
    var name: String
    var age: Int
}
