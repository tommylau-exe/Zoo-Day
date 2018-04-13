//
//  GameScene.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/13/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, UIGestureRecognizerDelegate {
    
    //MARK: Variables
    let defaults = UserDefaults.standard
    
    var pageID: Page!
    
    //Nodes
    var footer: SKReferenceNode!
    var backButton: SKSpriteNode!
    var nextButton: SKSpriteNode!
    var homeButton: SKSpriteNode!
    var readButton: SKSpriteNode!
    var muteButton: SKSpriteNode!
    
    //Narration
    var audioPlayer: AVAudioPlayer?
    var narration: SKAudioNode?
    var narrationDelay: Double = 0.25
    
    //SKAction sequences
    let popAction: [SKAction] = [.scale(by: 1.1, duration: 0.05), .scale(by: 0.909, duration: 0.05)]
    let shakeAction: [SKAction] = [.rotate(byAngle: (CGFloat.pi / 18), duration: 0.05), .rotate(byAngle: -(CGFloat.pi * 2) / 18, duration: 0.1), .rotate(byAngle: (CGFloat.pi / 18), duration: 0.05)]
    
    //MARK: - Public Functions
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //Init
        footer = childNode(withName: "footer") as! SKReferenceNode
        backButton = footer.childNode(withName: "//back") as! SKSpriteNode
        nextButton = footer.childNode(withName: "//next") as! SKSpriteNode
        homeButton = footer.childNode(withName: "//home") as! SKSpriteNode
        readButton = footer.childNode(withName: "//read") as! SKSpriteNode
        muteButton = footer.childNode(withName: "//mute") as! SKSpriteNode
        
        //Swipe gesture recognizers
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight(sender:)))
        swipeRight.direction = .right
        swipeRight.delegate = self
        swipeRight.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft(sender:)))
        swipeLeft.direction = .left
        swipeLeft.delegate = self
        swipeLeft.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeLeft)
        
        if !defaults.bool(forKey: "mute") {
            startNarration()
        }
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
        if backButton.isHidden { return }
        
        if let scene = getPreviousScene() {
            goBackToScene(scene: scene)
        }
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer) {
        if nextButton.isHidden && readButton.isHidden { return }
        
        if let scene = getNextScene() {
            goToScene(scene: scene)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        // 1
        let touchLocation = touch.location(in: self)
        
        // 2
        if footer.contains(touchLocation) {
            let location = touch.location(in: footer)
            
            // 3
            if nextButton.contains(location) && !nextButton.isHidden || readButton.contains(location) && !readButton.isHidden {
                if let scene = getNextScene() {
                    goToScene(scene: scene)
                }
            } else if backButton.contains(location) && !backButton.isHidden {
                if let scene = getPreviousScene() {
                    goBackToScene(scene: scene)
                }
            } else if homeButton.contains(location) {
                goBackToScene(scene: SKScene(fileNamed: "TitleScene") as! TitleScene)
            } else if muteButton.contains(location) && !muteButton.isHidden {
                toggleMuteButton()
            }
            
        } else {
            
            // 4
            touchDown(atPoint: touchLocation)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        touchMoved(toPoint: touch.location(in: self))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        touchUp(atPoint: touch.location(in: self))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        touchUp(atPoint: touch.location(in: self))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    //MARK: - Private functions
    
    //Scene functions
    private func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.reveal(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        
        self.run(.playSoundFileNamed("PageTurn", waitForCompletion: false))
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    private func goBackToScene(scene: SKScene) {
        let sceneTransition = SKTransition.moveIn(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        
        self.run(.playSoundFileNamed("PageTurn", waitForCompletion: false))
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    private func getNextScene() -> SKScene? {
        var rawValue = pageID.rawValue
        if rawValue < 14 {
            rawValue += 1
        }
        return SKScene(fileNamed: (Page.init(rawValue: rawValue)?.getName())!)
    }
    
    private func getPreviousScene() -> SKScene? {
        var rawValue = pageID.rawValue
        if rawValue > 0 {
            rawValue -= 1
        }
        return SKScene(fileNamed: (Page.init(rawValue: rawValue)?.getName())!)
    }
    
    //Narration functions
    private func toggleMuteButton() {
        
        let shouldMute = !defaults.bool(forKey: "mute")
        
        defaults.set(shouldMute, forKey: "mute")
        
        if shouldMute {
            muteButton.texture = SKTexture(imageNamed: "Footer - Sound Toggle Mute")
            stopNarration()
        } else {
            muteButton.texture = SKTexture(imageNamed: "Footer - Sound Toggle Unmute")
        }
        
    }
    
    private func startNarration() {
        muteButton.texture = SKTexture(imageNamed: "Footer - Sound Toggle Unmute")
        
        guard let narrationPath = Bundle.main.path(forResource: "\(pageID.getName())Narration", ofType: "mp3") else { return }
        let narrationUrl = URL(fileURLWithPath: narrationPath)
        
        //Narration crashes iPad Mini 1 running iOS 9.3.5 when using SKAudioNode, so AVAudioPlayer is used instead for all iOS 9 devices
        //Zoo Day[11646:592313] *** Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: 'required condition is false: _engine->IsRunning()'
        
        if #available(iOS 10.0, *) {
            //Newer SKAudioNode implementation
            narration = SKAudioNode(url: narrationUrl)
            guard let narration = narration else { return }
            
            narration.autoplayLooped = false
            addChild(narration)
            narration.run(.sequence([.changeVolume(to: 2, duration: 0), .wait(forDuration: narrationDelay), .play()]), withKey: "narration")
        } else {
            //AVAudioPlayer implementation for legacy devices
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: narrationUrl)
                audioPlayer!.volume = 2
                audioPlayer!.prepareToPlay()
                audioPlayer!.play(atTime: audioPlayer!.deviceCurrentTime + narrationDelay)
            } catch {
                print("ERROR: error starting avaudioplayer for narration")
            }
        }
    }
    
    private func stopNarration() {
        
        if #available(iOS 10.0, *) {
            guard let narration = narration else { return }
            narration.run(.stop())
        } else {
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.stop()
        }
        
    }
    
}

//MARK: - Page Enumeration
enum Page: Int {
    case Title = 0,
    One = 1,
    Two = 2,
    Three = 3,
    Four = 4,
    Five = 5,
    Six = 6,
    Seven = 7,
    Eight = 8,
    Nine = 9,
    Ten = 10,
    Eleven = 11,
    Twelve = 12,
    Thirteen = 13,
    Fourteen = 14
    
    func getName() -> String {
        if self == .Title {
            return "TitleScene"
        } else if self.rawValue < 10 {
            return "Scene0\(self.rawValue)"
        } else {
            return "Scene\(self.rawValue)"
        }
    }
}
