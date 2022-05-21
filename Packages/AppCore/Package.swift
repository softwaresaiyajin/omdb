// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AppCore",
    products: [
        .library(
            name: "AppCore",
            targets: ["AppCore"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppCore",
            dependencies: [
                
            ]),
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["AppCore"]),
    ]
)
