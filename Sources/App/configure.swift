import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))


    
    app.databases.use(.postgres(hostname: "localhost", username:"postgres",password:"", database:"bookdb"), as: .psql)

   
    app.migrations.add(CreatBook())
    app.migrations.add(CreatReview())
    app.migrations.add(AddCoverCulumToBook())
    app.migrations.add(AddEditionCulumToBook())
    // register routes
    try routes(app)
}
