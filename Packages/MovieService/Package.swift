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
        .package(path: "../OmdbSDK"),
        .package(path: "../AppCore"),
    ],
    targets: [
        .target(
            name: "MovieService",
            dependencies: [
                "MovieServiceInterface",
                "OmdbSDK",
                "AppCore",
            ]),
        .testTarget(
            name: "MovieServiceTests",
            dependencies: ["MovieService"]),
    ]
)
