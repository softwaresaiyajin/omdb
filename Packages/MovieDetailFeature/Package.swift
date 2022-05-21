// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MovieDetailFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MovieDetailFeature",
            targets: ["MovieDetailFeature"]),
    ],
    dependencies: [
        .package(path: "../MovieServiceInterface"),
        .package(path: "../AppUI"),
        .package(path: "../AppCore"),
    ],
    targets: [
        .target(
            name: "MovieDetailFeature",
            dependencies: [
                "MovieServiceInterface",
                "AppUI",
                "AppCore"
            ]
        ),
        .testTarget(
            name: "MovieDetailFeatureTests",
            dependencies: ["MovieDetailFeature"]),
    ]
)
