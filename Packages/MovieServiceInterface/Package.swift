// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MovieServiceInterface",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MovieServiceInterface",
            targets: ["MovieServiceInterface"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MovieServiceInterface",
            dependencies: []
        )
    ]
)
