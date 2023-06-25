// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CSDL_1",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "CSDL",
      targets: ["CSDL_1"])
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .systemLibrary(
      name: "CSDL2",
      pkgConfig: "sdl2",
      providers: [.brew(["libsdl2"]), .apt(["libsdl2-dev"])]),
    .target(
      name: "CSDL_1",
      dependencies: ["CSDL2"]),
    .testTarget(
      name: "CSDLTests",
      dependencies: ["CSDL_1"]),
  ]
)
