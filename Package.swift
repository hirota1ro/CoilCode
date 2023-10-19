// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoilCode",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CGLib",
            dependencies: []),
        .target(
            name: "Sprite",
            dependencies: ["CGLib"]),
        .executableTarget(
            name: "CoilCode",
            dependencies: ["CGLib", "Sprite", .product(name: "ArgumentParser", package: "swift-argument-parser") ]),
        .testTarget(
            name: "CGLibTests",
            dependencies: ["CGLib"]),
        .testTarget(
            name: "SpriteTests",
            dependencies: ["Sprite"]),
        .testTarget(
            name: "CoilCodeTests",
            dependencies: ["CoilCode"]),
    ]
)
