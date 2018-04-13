//
//  Scene10.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene10: GameScene {
    
    var chameleon: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Ten
        super.didMove(to: view)
        
        //Init
        chameleon = childNode(withName: "chameleon") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if chameleon.contains(pos) && chameleon.action(forKey: "pop") == nil {
            chameleon.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
