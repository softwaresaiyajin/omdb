// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "OmdbSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "OmdbSDK",
            targets: ["OmdbSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.6.1"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "OmdbSDK",
            dependencies: [
                "Alamofire"
            ]),
        .testTarget(
            name: "OmdbSDKTests",
            dependencies: ["OmdbSDK"]),
    ]
)
