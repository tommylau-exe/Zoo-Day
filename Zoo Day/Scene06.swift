//
//  Scene06.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene06: GameScene {
    
    var squirrel: SKSpriteNode!
    var butterfly: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Six
        super.didMove(to: view)
        
        //Init
        squirrel = childNode(withName: "squirrel") as! SKSpriteNode
        butterfly = childNode(withName: "butterfly") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if squirrel.contains(pos) && squirrel.action(forKey: "pop") == nil {
            squirrel.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if butterfly.contains(pos) && butterfly.action(forKey: "pop") == nil {
            butterfly.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
    }
}
