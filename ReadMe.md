
# Debug Server Host For iOS

## 更新（2016.11.28）

> 增加了`rnpm install react-native-DebugServerHost`的支持。

## 更新（2016.11.15）

> 由于react native更换的URL的使用方式（增加了RCTBundleURLProvider类处理URL），所以旧的方式不再适应，进行新版本的改造，不再适配v0.29以下版本。新方式下只需输入IP地址，比较好输入，因此去掉了二维码扫描方式。


## React Native服务器地址更换

运行时更换服务器地址，不用为更换调试服务器地址而频繁打包。android调试状态有更换服务器地址功能，而iOS不具备此功能，本库就是为iOS提供此功能。

![](./image/1.png)

## 安装

方式一：

使用`rnpm install react-native-DebugServerHost`来安装，自动集成到工程。（注意名称，不是react-native-debug-server-host，没有安装rnpm的先安装`npm install rnpm -g`）

或者：

`npm install react-native-DebugServerHost --save`

`react-native link`

方式二：

直接将DebugServerHost文件夹添加到项目中即可，无需任何设置。


## 使用

模拟器使用`Command+D`，真实设备使用摇一摇即可唤出调试菜单，选择最后一项`Debug server host`就可以修改服务器地址了。

![](./image/2.png)

> 注意：修改完地址需要重新启动APP才能生效。

> 由于RN在debug模式下，会自动在安装包中添加ip.txt文件，保存开发机IP地址，并将main.jsbundle集成到APP中。首先通过IP地址去访问远程js脚本，如果没有找到，则使用安装目录中的main.jsbundle。但是目前在0.37版本中，第一步如果IP地址不正确，经常造成闪退。如果是这种情况，***可以先把手机网络全关，打开APP加载本地main.jsbundle后再更换正确的服务器地址***。



