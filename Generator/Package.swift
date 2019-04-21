// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "CuckooGenerator",
    products: [
        .library(name: "CuckooGeneratorFramework", targets:["CuckooGeneratorFramework", "cuckoo_generator"]),
        .executable(name: "cuckoo_generator", targets: ["cuckoo_generator"])

    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten.git", .upToNextMinor(from: "0.23.0")),
        .package(url: "https://github.com/nvzqz/FileKit.git", .branch("develop")),
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.13.0"),
        .package(url: "https://github.com/Carthage/Commandant.git", from: "0.17.0")
        ],
    targets: [
        .target(name: "CuckooGeneratorFramework", dependencies: [
            "FileKit", "SourceKittenFramework", "Stencil", "Commandant"], exclude: ["Tests"]),

        .target(name: "cuckoo_generator", dependencies: [
            .target(name: "CuckooGeneratorFramework")], exclude: ["Tests"]),
        ]
)
