// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MovieListFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MovieListFeature",
            targets: ["MovieListFeature"]),
    ],
    dependencies: [
        .package(path: "../MovieServiceInterface"),
        .package(path: "../AppUI"),
    ],
    targets: [
        .target(
            name: "MovieListFeature",
            dependencies: [
                "MovieServiceInterface",
                "AppUI"
            ]),
        .testTarget(
            name: "MovieListFeatureTests",
            dependencies: ["MovieListFeature"]),
    ]
)
