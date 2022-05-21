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
        .package(path: "../InternationalizationServiceInterface"),
        .package(path: "../AppUI"),
        .package(path: "../AppCore"),
    ],
    targets: [
        .target(
            name: "MovieListFeature",
            dependencies: [
                "MovieServiceInterface",
                "InternationalizationServiceInterface",
                "AppUI",
                "AppCore"
            ]),
        .testTarget(
            name: "MovieListFeatureTests",
            dependencies: ["MovieListFeature"]),
    ]
)
