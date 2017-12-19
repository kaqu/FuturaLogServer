// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "FuturaLogServer",
    dependencies: [
        // 💧 A server-side Swift web framework. 
        .package(url: "https://github.com/vapor/vapor.git", .exact("3.0.0-alpha.x")),
        .package(url: "https://github.com/vapor/jwt.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/kaqu/FuturaAsync.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "https://github.com/kaqu/FuturaLog.git", .upToNextMajor(from: "0.6.0")),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: ["Routing", "Service", "Vapor", "JWT", "FuturaLog", "FuturaAsync"]
        ),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

