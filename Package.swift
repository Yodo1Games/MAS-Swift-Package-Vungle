// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationVungle",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationVungle", targets: ["Yodo1MasMediationVungleTarget"]),
        .library(name: "Yodo1MasMediationVungle-AppLovinMediationVungleAdapter", targets: ["Yodo1MasMediationVungle-AppLovinMediationVungleAdapterTarget"]),
        .library(name: "Yodo1MasMediationVungle-LiftoffMonetizeAdapter", targets: ["Yodo1MasMediationVungle-LiftoffMonetizeAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager.git", exact: "7.7.8"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationVungle ====================
        .target(
            name: "Yodo1MasMediationVungleTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationVungle"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "VungleAdsSDK", package: "VungleAdsSDK-SwiftPackageManager"),
            ],
            path: "Sources/Yodo1MasMediationVungleTarget",
            resources: [.copy("Yodo1MasVungle.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationVungle",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationVungle/Yodo1MasMediationVungle-5.0.0-beta.5.zip",
            checksum: "578b23238a4f9090d99429527d363dfa26b7e6a2977a4dfaaffc4b3398891a27"
        ),
        // ==================== Yodo1MasMediationVungle-AppLovinMediationVungleAdapter ====================
        .target(
            name: "Yodo1MasMediationVungle-AppLovinMediationVungleAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationVungleTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationVungleAdapter"),
            ],
            path: "Sources/Yodo1MasMediationVungle-AppLovinMediationVungleAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationVungleAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationVungle/AppLovinMediationVungleAdapter-5.0.0-beta.5.zip",
            checksum: "8a73e6ae8f65b23744cb0a429b37ad6301612c6333caecebffd80455f436bdef"
        ),
        // ==================== Yodo1MasMediationVungle-LiftoffMonetizeAdapter ====================
        .target(
            name: "Yodo1MasMediationVungle-LiftoffMonetizeAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationVungleTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "LiftoffMonetizeAdapter"),
            ],
            path: "Sources/Yodo1MasMediationVungle-LiftoffMonetizeAdapterTarget"
        ),
        .binaryTarget(
            name: "LiftoffMonetizeAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationVungle/LiftoffMonetizeAdapter-5.0.0-beta.5.zip",
            checksum: "1f1fc46c88274a4444836cb864bfc2dd2f6408b1e423a6e1a97e55e5d132747d"
        ),
    ]
)
