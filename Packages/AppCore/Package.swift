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
        .package(url: "https://github.com/Swinject/Swinject", from: "2.7.1"),
        .package(url: "https://github.com/Swinject/SwinjectAutoregistration", from: "2.7.0"),
    ],
    targets: [
        .target(
            name: "AppCore",
            dependencies: [
                "Swinject",
                "SwinjectAutoregistration"
            ]),
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["AppCore"]),
    ]
)
