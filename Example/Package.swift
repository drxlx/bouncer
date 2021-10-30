// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Example",
    dependencies: [
        .package(name: "Bouncer", path: "../bouncer"),
    ],
    targets: [
        .target(
            name: "Example",
            dependencies: ["Bouncer"])
    ]
)
