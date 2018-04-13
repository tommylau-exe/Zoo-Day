//
//  Scene09.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene09: GameScene {
    
    var bigThoughtBubble: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Nine
        super.didMove(to: view)
        
        //Init
        bigThoughtBubble = childNode(withName: "bigThoughtBubble") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if bigThoughtBubble.contains(pos) && bigThoughtBubble.action(forKey: "pop") == nil {
            bigThoughtBubble.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
