//
//  Scene02.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/24/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene02: GameScene {
    
    var clock: SKSpriteNode!
    var dog: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Two
        narrationDelay = 3.25
        super.didMove(to: view)
        
        //Init
        clock = childNode(withName: "clock") as! SKSpriteNode
        dog = childNode(withName: "dog") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if clock.contains(pos) && clock.action(forKey: "shakeWithAlarm") == nil {
            clock.run(.sequence([.playSoundFileNamed("Alarm2", waitForCompletion: false)] + shakeAction + shakeAction + [.wait(forDuration: 0.2)]), withKey: "shakeWithAlarm")
        }
        
        if dog.contains(pos) && dog.action(forKey: "bark") == nil {
            dog.run(.sequence([.playSoundFileNamed("Bark", waitForCompletion: false)] + popAction + [.wait(forDuration: 0.3)]), withKey: "bark")
        }
    }
    
}
