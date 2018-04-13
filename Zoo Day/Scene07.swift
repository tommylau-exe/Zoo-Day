//
//  Scene07.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene07: GameScene {
    
    var light: SKSpriteNode!
    var speechBubble: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Seven
        super.didMove(to: view)
        
        //Init
        speechBubble = childNode(withName: "speechBubble") as! SKSpriteNode
        light = childNode(withName: "light") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if speechBubble.contains(pos) && speechBubble.action(forKey: "pop") == nil {
            speechBubble.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if light.contains(pos) && light.action(forKey: "pop") == nil {
            light.run(.sequence(popAction + [.playSoundFileNamed("Zap", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
