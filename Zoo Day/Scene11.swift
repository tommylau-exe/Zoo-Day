//
//  Scene11.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene11: GameScene {
    
    var seal: SKSpriteNode!
    var wowSpeechBubble: SKSpriteNode!
    var happySpeechBubble: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Eleven
        narrationDelay = 5.25
        super.didMove(to: view)
        
        //Init
        seal = childNode(withName: "seal") as! SKSpriteNode
        wowSpeechBubble = childNode(withName: "wowSpeechBubble") as! SKSpriteNode
        happySpeechBubble = childNode(withName: "happySpeechBubble") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if seal.contains(pos) && seal.action(forKey: "pop") == nil {
            seal.run(.sequence(popAction + [.playSoundFileNamed("Sploosh", waitForCompletion: true)]), withKey: "pop")
        }
        
        if wowSpeechBubble.contains(pos) && wowSpeechBubble.action(forKey: "pop") == nil {
            wowSpeechBubble.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if happySpeechBubble.contains(pos) && happySpeechBubble.action(forKey: "pop") == nil {
            happySpeechBubble.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
