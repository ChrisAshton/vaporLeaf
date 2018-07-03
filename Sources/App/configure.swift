import FluentSQLite
import Vapor
import Leaf // added
/// Called before your application initializes.
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
    ) throws {
    

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    let myService = NIOServerConfig.default(port: 8001)
    services.register(myService)
    
    // Register the LeafProvider
    let leafProvider = LeafProvider() // added
    try services.register(leafProvider) // added
    
    // Set LeafRenderer as our preferred ViewRenderer
    config.prefer(LeafRenderer.self, for: ViewRenderer.self) // added

}
