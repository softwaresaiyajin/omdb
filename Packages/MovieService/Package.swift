// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MovieService",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MovieService",
            targets: ["MovieService"]),
    ],
    dependencies: [
        .package(path: "../MovieServiceInterface"),
        .package(path: "../OmdbSDK")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MovieService",
            dependencies: [
                "MovieServiceInterface",
                "OmdbSDK"
            ]),
        .testTarget(
            name: "MovieServiceTests",
            dependencies: ["MovieService"]),
    ]
)
