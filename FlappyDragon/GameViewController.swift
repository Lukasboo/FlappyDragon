//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Lucas Daniel on 21/03/2018.
//  Copyright © 2018 Lucas Daniel. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation



class GameViewController: UIViewController {

    var stage: SKView!
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as! SKView
        stage.ignoresSiblingOrder = true
        
        presentScene()
        playMusic()
    }
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "mp3") {
            musicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
            musicPlayer.numberOfLoops = -1
            musicPlayer.volume = 0.4
            musicPlayer.play()
        }
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        //stage.presentScene(scene)
        stage.presentScene(scene, transition: .doorway(withDuration: 0.5))
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
