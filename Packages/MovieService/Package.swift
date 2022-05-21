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
        .package(url: "https://github.com/Swinject/Swinject", from: "2.7.1"),
        .package(url: "https://github.com/Swinject/SwinjectAutoregistration", from: "2.7.0")
    ],
    targets: [
        .target(
            name: "MovieService",
            dependencies: [
                "MovieServiceInterface",
                "OmdbSDK",
                "Swinject",
                "SwinjectAutoregistration"
            ]),
        .testTarget(
            name: "MovieServiceTests",
            dependencies: ["MovieService"]),
    ]
)
