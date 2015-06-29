//
//  PlayerViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController, STKAudioPlayerDelegate {
    
    @IBOutlet var playerLabel:UILabel?
    @IBOutlet var playerButton:UIButton?
    
    var player:STKAudioPlayer?
    
    let url = "http://domradio-mp3-m.akacast.akamaistream.net/7/148/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-m"
    
    @IBAction func buttonPressed(){
        if player == nil {
            self.player = STKAudioPlayer()
            self.player?.delegate = self
        }
        if let audioPlayer = player{
            if(audioPlayer.state.value == STKAudioPlayerStateReady.value)
                || (audioPlayer.state.value == STKAudioPlayerStateStopped.value){
                audioPlayer.play(url)
            }else{
                audioPlayer.stop()
            }
        }
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView();
    }
    
    func updateView(){
        
        if let label = self.playerLabel, let button = self.playerButton{
            if let audioPlayer = player{
                println(audioPlayer.state.value)
                if(audioPlayer.state.value == STKAudioPlayerStateBuffering.value){
                    label.text = "Lädt ..."
                    button.imageView?.image = UIImage(named: "PauseButton")
                }else if(audioPlayer.state.value == STKAudioPlayerStatePlaying.value){
                    label.text = "domradio.de Livestream"
                    button.imageView?.image = UIImage(named: "PauseButton")
                }else{
                    label.text = "domradio.de Livestream"
                    button.imageView?.image = UIImage(named: "PlayButton")
                }
            }else{
                label.text = "domradio.de Livestream"
                button.imageView?.image = UIImage(named: "PlayButton")
            }
            
        }
    }

    func audioPlayer(audioPlayer: STKAudioPlayer!, didStartPlayingQueueItemId queueItemId: NSObject!) {

    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject!) {

    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
        self.updateView()
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishPlayingQueueItemId queueItemId: NSObject!, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: Double, andDuration duration: Double) {
        self.updateView()
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, unexpectedError errorCode: STKAudioPlayerErrorCode) {
        RKDropdownAlert.title("Netzwerkfehler", message: "Stream konnte nicht gestartet werden!" );
        self.updateView()
    }
    
    
}
