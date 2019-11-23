![MHTE8J.png](https://s2.ax1x.com/2019/11/23/MHTE8J.png)

[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod Platform](http://img.shields.io/cocoapods/p/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod License](http://img.shields.io/cocoapods/l/SDWebImage.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)]()

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


## 联系我
- 如果你 **发现了Bug**, 请提issue.

## 作者
- [HuangHong](https://github.com/BBC6BAE9)

## Licenses

All source code is licensed under the [MIT License]().

## 架构

![Mb33k9.png](https://s2.ax1x.com/2019/11/23/Mb33k9.png)

## 存储结构

![MbUHIS.png](https://s2.ax1x.com/2019/11/23/MbUHIS.png)


## 如何使用

* Objective-C

```objective-c
#import "BBEventBus.h"
...
[BBEVENTBUS subscribeEventWithEventname:@"dataDidchanged" andTaget:self handler:^(NSString * _Nonnull eventName, id  _Nonnull object) {

}];
```
