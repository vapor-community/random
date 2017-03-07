// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Random",
    dependencies: [
        // Core extensions, type-aliases, and functions that facilitate common tasks.
        .Package(url: "https://github.com/vapor/core.git", Version(2,0,0, prereleaseIdentifiers: ["alpha"]))
    ]
)
