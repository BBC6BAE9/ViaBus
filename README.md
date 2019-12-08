![image](https://github.com/KunMinX/android-viabus-architecture/blob/master/images/viabuslogo.png)

![image](https://img.shields.io/badge/jcenter-0.4.8-brightgreen.svg)
![image](https://img.shields.io/badge/api-%2B15-blue.svg)
![image](https://img.shields.io/badge/license-Apache2.0-blue.svg)
![image](https://img.shields.io/badge/author-KunMinX-orange.svg)

### [VIABUS Android 端解决方案 同步更新！🎉🎉🎉](https://github.com/KunMinX/VIABUS-Architecture)

### [中文文档]() | [English]()

# 什么是 VIABUS
⭐VIABUS-Architecture-iOS 是objective - C版本的轻量级事件总线，采用观察者模式（发布/订阅）的一种实现，借助总线转发数据的请求和响应，实现 UI与业务、模块与模块之间的完全解耦。是App内各功能部件之间传送信息的`公共通信干线`。
轻量级的事件总线，轻松实现模块间解耦，无需管理订阅周期....

![Mb33k9.png](https://s2.ax1x.com/2019/11/23/Mb33k9.png)

# 为什么选择 VIABUS 

- 不需要移除事件监听，自动管理监听的生命周期（在订阅者实例被释放的时候，会自动移除监听）🏣
- 1分钟即可掌握，VIABUS 的结构与使用方式。💡
- 当下就可使用，对原项目架构完全兼容，即插即用。🔥
- 允许以 业务或模块为单位，每天1小时，完成渐进式重构。💧
- 职责边界明确，无论是写 UI 还是业务，不再被打断、相互不拖累。🌱
- 无编译时注解，基于 VIABUS 编写的组件可在任何项目中直接使用。🌎
- 更少的重复工作，扁平的交互模式，代码复用率提升至100%。💪
- ...


# 如何使用 VIABUS 

* Objective-C

```objective-c
#import "BBEventBus.h"
...
[BBEVENTBUS subscribeEventWithEventname:@"dataDidchanged" andTaget:self handler:^(NSString * _Nonnull eventName, id  _Nonnull object) {

}];
```

## 存储结构

![MbUHIS.png](https://s2.ax1x.com/2019/11/23/MbUHIS.png)

# 支持的事件类型

- NSNotification
- AppDelegate中的App行为通知（updating...）

# 三方库
- [RFDestoryNotify](https://github.com/refusebt/RFDestoryNotify) - 监听实例的释放

# 更多访问

Email：[chinahuanghong@gmail.com](mailto:chinahuanghong@gmail.com)

Home：[作者的个人博客](http://www.bbc6bae9.com/)

# Requirements

- iOS 8.0 or later
- macOS 10.10 or later (10.15 for Catalyst)
- Xcode 10.0 or later

# Licenses

All source code is licensed under the [MIT License]().

