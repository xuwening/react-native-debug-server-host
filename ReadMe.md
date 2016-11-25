
# Debug Server Host For iOS

## 更新（2016.11.15）

一、由于react native更换的URL的使用方式（增加了RCTBundleURLProvider类处理URL），所以旧的方式不再适应，进行新版本的改造，不再适配v0.29以下版本。

二、为了方便使用，增加了cocoaPods的支持。

## React Native服务器地址更换

运行时更换服务器地址，不用为更换调试服务器地址而频繁打包。android调试状态有更换服务器地址功能，而iOS不具备此功能，本库就是为iOS提供此功能。

![](./image/1.png)

## 安装

1、cocoapods方式：Podfile添加`pod 'DebugServerHost'`
2、直接将DebugServerHost文件夹添加到项目中即可，无需任何设置。

## 使用

模拟器使用`Command+D`，真实设备使用摇一摇即可唤出调试菜单，选择最后一项`Debug server host`就可以修改服务器地址了。

![](./image/2.png)

>>> 注意：修改完地址需要重新启动APP才能生效。




