// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.  
//
// This source file is part of the Apodini open source project
// 
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//


import PackageDescription

let package = Package(
    name: "ApodiniDocumentExport",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ApodiniDocumentExport",
            targets: ["ApodiniDocumentExport"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.4.4")),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        .package(url: "https://github.com/omochi/FineJSON.git", from: "1.14.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApodiniDocumentExport",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "PathKit", package: "PathKit"),
                .product(name: "FineJSON", package: "FineJSON"),
                .product(name: "Yams", package: "Yams")
            ]),
        .testTarget(
            name: "ApodiniDocumentExportTests",
            dependencies: [
                "ApodiniDocumentExport"
            ],
            resources: [
                .process("document.json")
            ]),
    ]
)
