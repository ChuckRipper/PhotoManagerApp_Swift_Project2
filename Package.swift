// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PhotoManagerApp_Swift_Project2",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .executable(name: "Client", targets: ["Client"]),
        .executable(name: "Server", targets: ["Server"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Client",
            dependencies: ["Alamofire"],
            path: "Sources/Client"
        ),
        .target(
            name: "Server",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
            ],
            path: "Sources/Server"
        ),
        .testTarget(
            name: "ClientTests",
            dependencies: ["Client"],
            path: "Tests/ClientTests"
        ),
        .testTarget(
            name: "ServerTests",
            dependencies: ["Server"],
            path: "Tests/ServerTests"
        ),
        .testTarget(
            name: "SharedTests",
            dependencies: ["Client", "Server"],
            path: "Tests/SharedTests"
        )
        // .executableTarget(
        //     name: "PhotoManagerApp_Swift_Project2"),
    ]
)
