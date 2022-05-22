// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "InternationalizationService",
    products: [
        .library(
            name: "InternationalizationService",
            targets: ["InternationalizationService"]),
    ],
    dependencies: [
        .package(path: "../InternationalizationServiceInterface"),
        .package(path: "../AppCore"),
    ],
    targets: [
        .target(
            name: "InternationalizationService",
            dependencies: [
                "InternationalizationServiceInterface",
                "AppCore"
            ]),
        .testTarget(
            name: "InternationalizationServiceTests",
            dependencies: ["InternationalizationService"]),
    ]
)
