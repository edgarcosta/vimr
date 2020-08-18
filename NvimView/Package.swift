// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "NvimView",
  platforms: [.macOS(.v10_13)],
  products: [
    .library(name: "NvimView", targets: ["NvimView"]),
  ],
  dependencies: [
    .package(name: "MessagePack", url: "https://github.com/a2/MessagePack.swift", .upToNextMinor(from: "4.0.0")),
    .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMinor(from: "5.1.1")),
    .package(name: "NvimServerTypes", url: "https://github.com/qvacua/neovim", .exact("0.1.0-types")),
    .package(name: "RxPack", path: "../RxPack"),
    .package(name: "Commons", path: "../Commons"),
  ],
  targets: [
    .target(
      name: "NvimView",
      dependencies: ["RxSwift", "NvimServerTypes", "RxPack", "MessagePack", "Commons"],
      // com.qvacua.NvimView.vim is copied by the download NvimServer script.
      exclude: ["com.qvacua.NvimView.vim"],
      resources: [
        .copy("runtime"),
        .copy("NvimServer"),
      ]
    ),
    .testTarget(
      name: "NvimViewTests",
      dependencies: ["NvimView"]
    ),
  ]
)
