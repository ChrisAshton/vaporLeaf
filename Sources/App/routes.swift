import Vapor
import Leaf // added
import Routing // added


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
    
    router.get("developer") { req -> Future<View> in
        let developer = Person(name: "Chris", age: 43)
        return try req.view().render("whoami", developer)
    }
}

// Important: Your class or struct conforms to Content
struct Person: Content {
    var name: String
    var age: Int
}
