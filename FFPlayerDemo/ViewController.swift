//
//  ViewController.swift
//  FFPlayerDemo
//
//  Created by Zihai on 2018/3/31.
//  Copyright © 2018年 Zihai. All rights reserved.
//

import UIKit
import IJKMediaFramework

class ViewController: UIViewController {

    var ijkPlayer:IJKFFMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = IJKFFOptions.byDefault()
        
        //视频源地址
        let url = URL(string: "rtmp://live.hkstv.hk.lxdns.com/live/hks")
//        let url = URL(string: "http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8")
        
        //初始化播放器，播放在线视频或直播（RTMP）
        let player = IJKFFMoviePlayerController(contentURL: url, with: options)
        //播放页面视图宽高自适应
        let autoresize = UIViewAutoresizing.flexibleWidth.rawValue |
            UIViewAutoresizing.flexibleHeight.rawValue
        player?.view.autoresizingMask = UIViewAutoresizing(rawValue: autoresize)
        player?.view.frame = view.bounds
        player?.scalingMode = .aspectFit //缩放模式
        player?.shouldAutoplay = true //开启自动播放
        player?.shouldShowHudView = false //不显示HUD视图
        view.autoresizesSubviews = true
        view.addSubview((player?.view)!)
        ijkPlayer = player
    }

    override func viewWillAppear(_ animated: Bool) {
        //开始播放
        ijkPlayer.prepareToPlay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //关闭播放器
        ijkPlayer.shutdown()
    }
}
