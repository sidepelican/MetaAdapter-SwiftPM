// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MetaAdapter-SwiftPM",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "MetaAdapter", targets: ["MetaAdapter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.11.0"),
    ],
    targets: [
        .target(
            name: "MetaAdapter",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                "BinaryMetaAdapter",
            ],
            path: "MetaAdapter"
        ),
        .binaryTarget(
            name: "BinaryMetaAdapter",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/meta/MetaAdapter-6.16.0.0.zip",
            checksum: "71a13abb8057caa971cb863890fb5d74a252906b83b299082a26183dffbc1b7c"
        ),
        .binaryTarget(
            name: "FBAudienceNetwork",
            path: "FBAudienceNetwork.xcframework"
        )
    ]
)
