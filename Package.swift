// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ColorVisualizer",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "ColorVisualizer", targets: ["ColorVisualizer"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.2.3")
    ],
    targets: [
        .executableTarget(
            name: "ColorVisualizer",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]
        ),
    ]
)
