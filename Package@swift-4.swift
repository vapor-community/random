// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Random",
    products: [
        .library(name: "Random", targets: ["Random"]),
    ],
    dependencies: [
        // Core extensions, type-aliases, and functions that facilitate common tasks.
        .package(url: "https://github.com/vapor/core.git", from: "2.1.0"),
    ],
    targets: [
        .target(name: "Random", dependencies: ["Core"]),
        .testTarget(name: "RandomTests", dependencies: ["Random"]),
    ]
)
