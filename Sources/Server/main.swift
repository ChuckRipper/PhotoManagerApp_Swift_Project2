import Vapor
import Fluent
import FluentPostgresDriver

// Configuring the application
var env = try Environment.detect()
let app = Application(env)
defer { app.shutdown() }

// Configuring the database
app.databases.use(.postgres(
    hostname: "localhost",
    username: "user",
    password: "password",
    database: "photomanager"
), as: .psql)

// Register routes
try routes(app)

// Run the application
try app.run()
