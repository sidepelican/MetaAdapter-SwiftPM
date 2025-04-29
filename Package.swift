// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MetaAdapter-SwiftPM",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "MetaAdapter", targets: ["MetaAdapterTarget"]),
        .library(name: "FBAudienceNetwork", targets: ["FBAudienceNetwork"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "12.1.0"),
    ],
    targets: [
        .target(
            name: "MetaAdapterTarget",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                "MetaAdapter",
            ],
            path: "MetaAdapter"
        ),
        .binaryTarget(
            name: "MetaAdapter",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/meta/MetaAdapter-6.17.1.0.zip",
            checksum: "472cfedbf403d9effc6f21b56f086d06e5644a4823c993edeff7ae5a4bb48e9b"
        ),
        .binaryTarget(
            name: "FBAudienceNetwork",
            path: "FBAudienceNetwork.xcframework"
        )
    ]
)
