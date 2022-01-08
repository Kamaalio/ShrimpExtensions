// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShrimpExtensions",
    platforms: [
        .iOS(.v9), .tvOS(.v10), .macOS(.v10_11)
    ],
    products: [
        .library(
            name: "ShrimpExtensions",
            targets: ["ShrimpExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", "4.0.0"..<"5.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", "9.0.0"..<"10.0.0"),
    ],
    targets: [
        .target(
            name: "ShrimpExtensions",
            dependencies: []),
        .testTarget(
            name: "ShrimpExtensionsTests",
            dependencies: [
                "ShrimpExtensions",
                "Quick",
                "Nimble",
            ]),
    ]
)
