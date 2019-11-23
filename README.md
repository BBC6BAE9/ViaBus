![MHTE8J.png](https://s2.ax1x.com/2019/11/23/MHTE8J.png)

[![Build Status](http://img.shields.io/travis/SDWebImage/SDWebImage/master.svg?style=flat)](https://travis-ci.org/SDWebImage/SDWebImage)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod Platform](http://img.shields.io/cocoapods/p/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod License](http://img.shields.io/cocoapods/l/SDWebImage.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/SDWebImage/SDWebImage)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Mac Catalyst compatible](https://img.shields.io/badge/Catalyst-compatible-brightgreen.svg)](https://developer.apple.com/documentation/xcode/creating_a_mac_version_of_your_ipad_app/)
[![codecov](https://codecov.io/gh/SDWebImage/SDWebImage/branch/master/graph/badge.svg)](https://codecov.io/gh/SDWebImage/SDWebImage)

轻量级的事件总线，轻松实现模块间解耦，无需管理订阅周期....

事件总线是观察者模式（发布/订阅）的一种实现，集中处理事件，但是不同功能模块之间不需要依赖从而达到解耦的目的，是App内各功能部件之间传送信息的`公共通信干线`。

## 特性

- [x] 实现模块与模块解耦
- [x] 不需要移除事件监听，自动管理监听的生命周期（在订阅者实例被释放的时候，会自动移除监听）
- [x] 当订阅者不再需要监听事件的时候，手动移除监听

## 支持的事件类型

- NSNotification
- AppDelegate中的App行为通知（稍后更新...）

#### 三方库
- [RFDestoryNotify](https://github.com/refusebt/RFDestoryNotify) - 监听实例的释放

## Requirements

- iOS 8.0 or later
- tvOS 9.0 or later
- watchOS 2.0 or later
- macOS 10.10 or later (10.15 for Catalyst)
- Xcode 10.0 or later

## 一览

- Read this Readme doc
- Read the [How to use section](https://github.com/SDWebImage/SDWebImage#how-to-use)
- Read the [Latest Documentation](https://sdwebimage.github.io/) and [CocoaDocs for old version](http://cocoadocs.org/docsets/SDWebImage/)
- Try the example by downloading the project from Github or even easier using CocoaPods try `pod try SDWebImage`
- Read the [Installation Guide](https://github.com/SDWebImage/SDWebImage/wiki/Installation-Guide)
- Read the [SDWebImage 5.0 Migration Guide](https://github.com/SDWebImage/SDWebImage/blob/master/Docs/SDWebImage-5.0-Migration-guide.md) to get an idea of the changes from 4.x to 5.x
- Read the [SDWebImage 4.0 Migration Guide](https://github.com/SDWebImage/SDWebImage/blob/master/Docs/SDWebImage-4.0-Migration-guide.md) to get an idea of the changes from 3.x to 4.x
- Read the [Common Problems](https://github.com/SDWebImage/SDWebImage/wiki/Common-Problems) to find the solution for common problems 
- Go to the [Wiki Page](https://github.com/SDWebImage/SDWebImage/wiki) for more information such as [Advanced Usage](https://github.com/SDWebImage/SDWebImage/wiki/Advanced-Usage)

## 谁在使用它


## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/sdwebimage). (Tag 'sdwebimage')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/sdwebimage).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.

## 如何使用

* Objective-C

```objective-c
#import "BBEventBus.h"
...
[BBEVENTBUS subscribeEventWithEventname:@"dataDidchanged" andTaget:self handler:^(NSString * _Nonnull eventName, id  _Nonnull object) {

}];
```


- For details about how to use the library and clear examples, see [The detailed How to use](https://github.com/SDWebImage/SDWebImage/blob/master/Docs/HowToUse.md)

## Animated Images (GIF) support

In 5.0, we introduced a brand new mechanism for supporting animated images. This includes animated image loading, rendering, decoding, and also supports customizations (for advanced users).
This animated image solution is available for `iOS`/`tvOS`/`macOS`. The `SDAnimatedImage` is subclass of `UIImage/NSImage`, and `SDAnimatedImageView` is subclass of `UIImageView/NSImageView`, to make them compatible with the common frameworks APIs. See [Animated Image](https://github.com/SDWebImage/SDWebImage/wiki/Advanced-Usage#animated-image-50) for more detailed information.

#### FLAnimatedImage integration has its own dedicated repo
In order to clean up things and make our core project do less things, we decided that the `FLAnimatedImage` integration does not belong here. From 5.0, this will still be available, but under a dedicated repo [SDWebImageFLPlugin](https://github.com/SDWebImage/SDWebImageFLPlugin).

## Installation

There are four ways to use SDWebImage in your project:
- using CocoaPods
- using Carthage
- using Swift Package Manager
- manual install (build frameworks or embed Xcode Project)

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```
platform :ios, '8.0'
pod 'SDWebImage', '~> 5.0'
```

##### Swift and static framework

Swift project previously have to use `use_frameworks!` to make all Pods into dynamic framework to let CocoaPods works.

However, start with `CocoaPods 1.5.0+` (with `Xcode 9+`), which supports to build both Objective-C && Swift code into static framework. You can use modular headers to use SDWebImage as static framework, without the need of `use_frameworks!`:

```
platform :ios, '8.0'
# Uncomment the next line when you want all Pods as static framework
# use_modular_headers!
pod 'SDWebImage', :modular_headers => true
```

See more on [CocoaPods 1.5.0 — Swift Static Libraries](http://blog.cocoapods.org/CocoaPods-1.5.0/)

If not, you still need to add `use_frameworks!` to use SDWebImage as dynamic framework:

```
platform :ios, '8.0'
use_frameworks!
pod 'SDWebImage'
```

#### Subspecs

There are 2 subspecs available now: `Core` and `MapKit` (this means you can install only some of the SDWebImage modules. By default, you get just `Core`, so if you need `MapKit`, you need to specify it). 

Podfile example:

```
pod 'SDWebImage/MapKit'
```

### Installation with Carthage (iOS 8+)

[Carthage](https://github.com/Carthage/Carthage) is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods.

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage)

Carthage users can point to this repository and use whichever generated framework they'd like: SDWebImage, SDWebImageMapKit or both.

Make the following entry in your Cartfile: `github "SDWebImage/SDWebImage"`
Then run `carthage update`
If this is your first time using Carthage in the project, you'll need to go through some additional steps as explained [over at Carthage](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

> NOTE: At this time, Carthage does not provide a way to build only specific repository subcomponents (or equivalent of CocoaPods's subspecs). All components and their dependencies will be built with the above command. However, you don't need to copy frameworks you aren't using into your project. For instance, if you aren't using `SDWebImageMapKit`, feel free to delete that framework from the Carthage Build directory after `carthage update` completes.

### Installation with Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

SDWebImage support SwiftPM from version 5.1.0. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [SDWebImage repo's URL](https://github.com/SDWebImage/SDWebImage.git). Or you can login Xcode with your GitHub account and just type `SDWebImage` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

If you're a framework author and use SDWebImage as a dependency, update your `Package.swift` file:

```swift
let package = Package(
    // 5.1.0 ..< 6.0.0
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    // ...
)
```

### Manual Installation Guide

See more on [Manual install Guide](https://github.com/SDWebImage/SDWebImage/wiki/Installation-Guide#manual-installation-guide)

### Import headers in your source files

In the source files where you need to use the library, import the umbrella header file:

```objective-c
#import <SDWebImage/SDWebImage.h>
```

### Build Project

At this point your workspace should build without error. If you are having problem, post to the Issue and the
community can help you solve it.

## 作者
- [HuangHong](https://github.com/BBC6BAE9)

## Licenses

All source code is licensed under the [MIT License]().

## 架构

![Mb33k9.png](https://s2.ax1x.com/2019/11/23/Mb33k9.png)

## 存储结构

![MbUHIS.png](https://s2.ax1x.com/2019/11/23/MbUHIS.png)

