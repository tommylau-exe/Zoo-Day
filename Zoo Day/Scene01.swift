//
//  Scene01.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/23/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene01: GameScene {
    
    var clock: SKSpriteNode!
    var cat: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.One
        narrationDelay = 3.5
        super.didMove(to: view)
        
        //Init
        clock = childNode(withName: "clock") as! SKSpriteNode
        cat = childNode(withName: "cat") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if clock.contains(pos) && clock.action(forKey: "shakeWithAlarm") == nil {
            clock.run(.sequence([.playSoundFileNamed("Alarm", waitForCompletion: false)] + shakeAction + shakeAction + [.wait(forDuration: 0.2)]), withKey: "shakeWithAlarm")
        }
        
        if cat.contains(pos) && cat.action(forKey: "meow") == nil {
            cat.run(.sequence([.playSoundFileNamed("Meow", waitForCompletion: false)] + popAction + [.wait(forDuration: 1.2)]), withKey: "meow")
        }
    }
    
}
