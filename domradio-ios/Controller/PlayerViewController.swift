//
//  PlayerViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet var playButton:UIButton?
    @IBOutlet var textLabel:UILabel?
    
    var player:AVPlayer!
    
    var state = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapDetected"))
        singleTap.numberOfTapsRequired = 1
        playButton!.addGestureRecognizer(singleTap)
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapDetected(){
        if(state){
            state = false
            playButton?.setImage(UIImage(named: "PauseButton"), forState: UIControlState.Normal)
            textLabel?.text = "Spielt ..."
            
            let url = "http://domradio-mp3-m.akacast.akamaistream.net/7/148/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-m"
            let playerItem = AVPlayerItem( URL:NSURL( string:url ) )
            player = AVPlayer(playerItem:playerItem)
            player.rate = 1.0;
            player.play()
        }else{
            state = true
            playButton?.setImage(UIImage(named: "PlayButton"), forState: UIControlState.Normal)
            textLabel?.text = "domradio.de Livestream"
            player.pause()
        }
    }

}
