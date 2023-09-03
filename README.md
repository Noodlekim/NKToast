[![Swift Compatibility](https://img.shields.io/badge/Swift_Compatibility-5.9_|_5.8_|_5.7_|_5.6-red)]()
[![Platform Compatibility](https://img.shields.io/badge/Platform_Compatibility-iOS-blue)](iOS) [![SPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swiftpackageindex.com/exyte/FloatingButton) [![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

# NKToast
A toast for swiftUI. It shows a top, center, and bottom 3 positions.

# GIF
|normal|error|
|:-:|:-:|
|![top](https://github.com/exyte/FloatingButton/assets/5136313/e5016101-2329-40be-91ad-646658405803)|![error](https://github.com/exyte/FloatingButton/assets/5136313/d06943f0-1599-448b-8b54-a92aba516b3e)|

# Usage
```swift
Text("View")
    .toast(messageType: .normal("A message at the top."), position: .top, showToast: $showForTop)
```

```swift
Text("View")
    .toast(messageType: .error("A message at the top."), position: .top, showToast: $showForTop)
```

# Installation
## Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/Noodlekim/NKToast.git", from: "1.0.0"),
]
```

# Requirements
- iOS 15.0+
- Xcode 13.2+
