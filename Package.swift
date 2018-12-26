// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "SwiftModuleRef",
    products: [
        .executable(name: "module-docs", targets: ["ModuleRefRunner","SwiftModuleRef"]),
        .library(name: "SwiftModuleRef", targets: ["SwiftModuleRef"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten", from: "0.22.0"),
        .package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8"), // dev
    ],
    targets: [
        .target(name: "ModuleRefRunner", dependencies: ["SwiftModuleRef"]),
        .target(name: "SwiftModuleRef", dependencies: ["SourceKittenFramework", "Logger"]),
        .testTarget(name: "SwiftModuleRefTests", dependencies: ["SwiftModuleRef"]),
    ]
)
