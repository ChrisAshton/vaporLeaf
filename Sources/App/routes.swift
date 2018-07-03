import Vapor
import Leaf // added


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
    
    router.get("view") { req -> Future<View> in
        return try req.view().render("welcome") // added
    }
    
    router.get("movies") { req -> Future<View> in
        return try req.view().render("fresh_tomatoes")
    }
    
    router.get("bonus") { req -> Future<View> in
        let data = ["name":"William", "age":"4"]
        return try req.view().render("whoami", data)
    }
}

// Important: Your class or struct conforms to Content
struct Person: Content {
    var name: String
    var age: Int
}
