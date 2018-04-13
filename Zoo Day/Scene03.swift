//
//  Scene03.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/24/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene03: GameScene {
    
    var sparkleGroup1: SKSpriteNode!
    var sparkleGroup2: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Three
        super.didMove(to: view)
        
        //Init
        sparkleGroup1 = childNode(withName: "sparkleGroup1") as! SKSpriteNode
        sparkleGroup2 = childNode(withName: "sparkleGroup2") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if sparkleGroup1.contains(pos) && sparkleGroup1.action(forKey: "sparklePop") == nil {
            sparklePop(withNode: sparkleGroup1)
        }
        
        if sparkleGroup2.contains(pos) && sparkleGroup2.action(forKey: "sparklePop") == nil {
            sparklePop(withNode: sparkleGroup2)
        }
    }
    
    private func sparklePop(withNode node: SKSpriteNode) {
        node.run(.sequence([.playSoundFileNamed("Twinkle", waitForCompletion: false)] + popAction + [.wait(forDuration: 0.8)]), withKey: "sparklePop")
        
        node.enumerateChildNodes(withName: "sparkle") {
            (node, _) in
            node.run(.sequence([.scale(by: 1.5, duration: 0.05), .scale(by: 0.666, duration: 0.05)]))
        }
    }
    
}
