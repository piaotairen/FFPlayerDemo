# FFPlayerDemo
RTMP player demo which write by Swift


Swift实现的RTMP推拉流播放器

1 Ijkplayer播放器集成

Ijkplayer 框架是B站提供了一个开源的流媒体解决方案，集成了ffmpeg，还支持硬解码(需iOS8以上版本)。使用Ijkplayer框架我们可以很方便地实现视频直播功能（HTTP/RTMP/RTSP 这几种直播源都支持）。
开源播放器集成Bilibili/ijkplayer
https://github.com/Bilibili/ijkplayer

运行./compile-ffmpeg.sh all报错问题xcrun: error: unable to lookup item 'PlatformPath' in SDK 'iphoneos’参见（一般由于安装了多个Xcode导致路径出错）
https://blog.csdn.net/woaizijiheni/article/details/50614062

运行脚本compile-ffmpeg.sh报错
License: LGPL version 2.1 or later
Creating config.mak, config.h, and doc/config.texi...

pkg-config命令出错
WARNING: pkg-config not found, library detection may fail.

mac os 安装 pkg-config
https://blog.csdn.net/sojlu/article/details/70229848

在Mac OS中安装 wget
https://blog.csdn.net/zjq_1990/article/details/52262966

命令sudo brew install wget报错
Error: Running Homebrew as root is extremely dangerous and no longer supported.
As Homebrew does not drop privileges on installation you would be giving all
build scripts full access to your system.
使用brew install wget

armv7,armv7s,arm64,i386,x86_64 都是什么
https://www.jianshu.com/p/3fce0bd6f045

两个脚本init-ios.sh compile-ffmpeg.sh的修改编译配置FF_ALL_ARCHS_IOS9_SDK 目前armv7、armv7s生成静态库相关的config配置有问题，暂不考虑该架构
#----------
# modify for your build tool

FF_ALL_ARCHS_IOS6_SDK="armv7 armv7s i386"
FF_ALL_ARCHS_IOS7_SDK="armv7 armv7s arm64 i386 x86_64"
FF_ALL_ARCHS_IOS8_SDK="armv7 arm64 i386 x86_64"
FF_ALL_ARCHS_IOS10_SDK="arm64 i386 x86_64"

FF_ALL_ARCHS=$FF_ALL_ARCHS_IOS10_SDK

ffmpeg configure配置选项
https://blog.csdn.net/momo0853/article/details/78043903

2实现rtmp拉流播放

编译运行出现错误
Undefined symbols for architecture arm64:
  "_OBJC_CLASS_$_IJKFFMoviePlayerController", referenced from:
      objc-class-ref in LQListDetailViewController.o
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
可以查看https://www.jianshu.com/p/0c0b14a67a6d
一般由于没有在Linked Frameworks and Libraries中导入IJKMediaFramework.framework导致。

关于IJKSDLGLView在非UI线程调用部分UI逻辑的问题修复
- (BOOL)isApplicationActiveSafeCheck方法区分主线程和子线程对- (BOOL)isApplicationActive
方法进行调用。
- (BOOL)setupGL中设置CAEAGLLayer *eaglLayer的逻辑采用同样策略修改
- (CAEAGLLayer *)eaglLayer 

IJKFFMoviePlayerController的播放器view不显示在控制器UIViewController的view上的问题修复

参考：
IJKPlayer的封装视频播放器封装，Swift编写
https://www.aliyun.com/jiaocheng/353119.html
Swift - 使用ijkplayer框架播放直播视频
https://blog.csdn.net/wangwtotao/article/details/61195349
如何快速的开发一个完整的iOS直播app
https://www.jianshu.com/p/7b2f1df74420
iOS中集成ijkplayer视频直播框架
https://www.jianshu.com/p/1f06b27b3ac0
