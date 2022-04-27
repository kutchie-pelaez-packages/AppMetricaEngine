// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "AppMetricaEngine",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "AppMetricaEngine",
            targets: [
                "AppMetricaEngine"
            ]
        )
    ],
    dependencies: [
        .package(name: "Analytics", url: "https://github.com/kutchie-pelaez-packages/Analytics.git", .branch("master")),
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master")),
        .package(name: "YandexMobileMetrica", url: "https://github.com/yandexmobile/metrica-sdk-ios.git", from: "3.14.0")
    ],
    targets: [
        .target(
            name: "AppMetricaEngine",
            dependencies: [
                .product(name: "Analytics", package: "Analytics"),
                .product(name: "Core", package: "Core"),
                .product(name: "YandexMobileMetrica", package: "YandexMobileMetrica")
            ],
            path: "Sources"
        ),
    ]
)
