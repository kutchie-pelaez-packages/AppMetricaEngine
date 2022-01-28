// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "AppMetricaEngine",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "AppMetricaEngine", targets: ["AppMetricaEngine"])
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core", .branch("master")),
        .package(name: "AnalyticsTracker", url: "https://github.com/kutchie-pelaez-packages/AnalyticsTracker", .branch("master")),
        .package(name: "YandexMobileMetrica", url: "https://github.com/yandexmobile/metrica-sdk-ios.git", from: "3.14.0")
    ],
    targets: [
        .target(
            name: "AppMetricaEngine",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "AnalyticsTracker", package: "AnalyticsTracker"),
                .product(name: "AnalyticsEvent", package: "AnalyticsTracker"),
                .product(name: "YandexMobileMetrica", package: "YandexMobileMetrica")
            ],
            path: "Sources"
        ),
    ]
)
