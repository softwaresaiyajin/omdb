// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AppUI",
    products: [
        .library(
            name: "AppUI",
            targets: ["AppUI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppUI",
            dependencies: []),
        .testTarget(
            name: "AppUITests",
            dependencies: ["AppUI"]),
    ]
)
