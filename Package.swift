// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "swift-crayons",
    platforms: [
        .iOS(.v13)
        
    ],
    products: [
        .library(
            name: "swift-crayons",
            targets: ["swift-crayons"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mhennemeyer/swift-toolbox", from: "2.0.21")
    ],
    targets: [
        .target(
            name: "swift-crayons",
            dependencies: ["swift-toolbox"],
            resources: nil
        )
    ]
)
