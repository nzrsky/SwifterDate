// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwifterDate",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .watchOS(.v6), .tvOS(.v13)
    ],
    products: [
        .library(name: "SwifterDate", targets: ["SwifterDate"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwifterDate",
            dependencies: [],
            path: "Sources/SwiftDate",
			resources: []
        ),

        .testTarget(
            name: "SwifterDateTests",
            dependencies: ["SwifterDate"],
            path: "Tests/SwiftDateTests"
        )
    ]
)
