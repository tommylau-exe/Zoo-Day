//
//  Scene12.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/27/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene12: GameScene {
    
    var parrot: SKSpriteNode!
    var thoughtBubble: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Twelve
        super.didMove(to: view)
        
        //Init
        parrot = childNode(withName: "parrot") as! SKSpriteNode
        thoughtBubble = childNode(withName: "thoughtBubble") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if parrot.contains(pos) && parrot.action(forKey: "pop") == nil {
            parrot.run(.sequence(popAction + [.playSoundFileNamed("Squawk", waitForCompletion: true)]), withKey: "pop")
        }
        
        if thoughtBubble.contains(pos) && thoughtBubble.action(forKey: "pop") == nil {
            thoughtBubble.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
