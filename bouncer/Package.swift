// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Bouncer",
    products: [
        .library(
            name: "Bouncer",
            targets: ["Bouncer"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Bouncer",
            dependencies: []),
        .testTarget(
            name: "BouncerTests",
            dependencies: ["Bouncer"]),
    ]
)
