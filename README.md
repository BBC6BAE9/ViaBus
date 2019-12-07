![image](https://github.com/KunMinX/android-viabus-architecture/blob/master/images/viabuslogo.png)

![image](https://img.shields.io/badge/jcenter-0.4.8-brightgreen.svg)
![image](https://img.shields.io/badge/api-%2B15-blue.svg)
![image](https://img.shields.io/badge/license-Apache2.0-blue.svg)
![image](https://img.shields.io/badge/author-KunMinX-orange.svg)

### [VIABUS iOS 端解决方案 现已同步上市！🎉🎉🎉](https://github.com/BBC6BAE9/BBEventBus)

### [中文文档](https://github.com/KunMinX/android-viabus-architecture/blob/master/README_CN.md) | [English](https://github.com/KunMinX/android-viabus-architecture/blob/master/README_EN.md)

# 什么是 VIABUS
⭐ VIABUS 是一款响应式架构，借助总线转发数据的请求和响应，实现 UI与业务、模块与模块之间的完全解耦。

![image](https://github.com/KunMinX/android-viabus-architecture/blob/master/images/viabus_flow_cn.png)

# 为什么选择 VIABUS 
- 1分钟即可掌握，VIABUS 的结构与使用方式。💡
- 当下就可使用，对原项目架构完全兼容，即插即用。🔥
- 允许以 业务或模块为单位，每天1小时，完成渐进式重构。💧
- 职责边界明确，无论是写 UI 还是业务，不再被打断、相互不拖累。🌱
- 无编译时注解，基于 VIABUS 编写的组件可在任何项目中直接使用。🌎
- 更少的重复工作，扁平的交互模式，代码复用率提升至100%。💪
- ...


# 如何使用 VIABUS 
在模块的 build.gradle 添加如下 任一 依赖
```java
//持续集成的 ViaBus 快速开发框架（包含 viabus 内核以及热门框架）
implementation "com.kunminx.viabus:architecture:0.4.8"

//纯粹的 ViaBus 内核（依赖它你就可以定制属于你的 ViaBus 架构啦）
implementation "com.kunminx.viabus:core:0.4.8"

```
使用方法详见 [1分钟掌握 ViaBus 架构和使用](https://www.jianshu.com/p/6545767d3e54)

# 更多访问

Email：[chinahuanghong@gmail.com](mailto:chinahuanghong@gmail.com)

Home：[作者的个人博客](http://www.bbc6bae9.com/)

# License

```
Copyright 2018-2019 KunMinX

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```






![MHTE8J.png](https://s2.ax1x.com/2019/11/23/MHTE8J.png)

[![Pod License](http://img.shields.io/cocoapods/l/SDWebImage.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)

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
- macOS 10.10 or later (10.15 for Catalyst)
- Xcode 10.0 or later

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
