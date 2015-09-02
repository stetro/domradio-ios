//
//  PlayerViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import StreamingKit
import RKDropdownAlert
import MarqueeLabel

class PlayerViewController: UIViewController, STKAudioPlayerDelegate, TitleRefresherDelegate {
    
    @IBOutlet var playerLabel:UILabel?
    @IBOutlet var playerButton:UIButton?
    @IBOutlet var playerInfoLabel:MarqueeLabel?
    
    let url = "http://domradio-mp3-m.akacast.akamaistream.net/7/148/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-m"
    let defaultPlayerState = "domradio.de Livestream"
    let defaultPlayerTitle = "Der gute Draht nach oben. - domradio.de"
    
    @IBAction func buttonPressed(){
        if player == nil {
            self.player = STKAudioPlayer()
            self.player?.delegate = self
        }
        if let audioPlayer = player{
            if  (audioPlayer.state == STKAudioPlayerStateReady) ||
                (audioPlayer.state == STKAudioPlayerStateStopped){
                audioPlayer.play(url)
            }else{
                audioPlayer.stop()
            }
        }
        self.updateView()
    }
    
    var player:STKAudioPlayer?
    var titleRefresher:TitleRefresher?
    var playerState:String?
    var playerTitle:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerState = self.defaultPlayerState
        self.playerTitle = self.defaultPlayerTitle
        self.updateView()
        self.titleRefresher = TitleRefresher(target: self)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        self.becomeFirstResponder()
        self.remoteControlText()
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.resignFirstResponder()
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        if let event = event{
            if(event.type == UIEventType.RemoteControl){
                switch(event.subtype){
                case UIEventSubtype.RemoteControlPause:
                    buttonPressed()
                    break
                case UIEventSubtype.RemoteControlPlay:
                    buttonPressed()
                    break
                case UIEventSubtype.RemoteControlTogglePlayPause:
                    buttonPressed()
                    break
                default:
                    break
                }
            }
        }
    }
    
    func updateView(){
        if let label = self.playerLabel, let button = self.playerButton{
            if let audioPlayer = player{
                if(audioPlayer.state == STKAudioPlayerStateBuffering){
                    self.playerState = "Lädt ..."
                    button.imageView?.image = UIImage(named: "PauseButton")
                }else if(audioPlayer.state == STKAudioPlayerStatePlaying){
                    self.playerState = self.defaultPlayerState
                    button.imageView?.image = UIImage(named: "PauseButton")
                }else{
                    self.playerState = self.defaultPlayerState
                    button.imageView?.image = UIImage(named: "PlayButton")
                }
            }else{
                self.playerState = self.defaultPlayerState
                button.imageView?.image = UIImage(named: "PlayButton")
            }
            label.text = self.playerState!
            self.remoteControlText()
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
    
    func remoteControlText(){
        var playingInfo = [String : AnyObject]()
        playingInfo[MPMediaItemPropertyTitle] = self.playerState!
        playingInfo[MPMediaItemPropertyArtist] = self.playerTitle!
        MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = playingInfo
    }
    
    func updateTitle(title:String){
        if let playerInfoLabel = self.playerInfoLabel{
            dispatch_async(dispatch_get_main_queue()) {
                playerInfoLabel.text = title
            }
            self.playerTitle = title
            remoteControlText()
        }
    }
}
