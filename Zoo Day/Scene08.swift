//
//  Scene08.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene08: GameScene {
    
    var ideaBubble: SKSpriteNode!
    var questionBubble: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Eight
        super.didMove(to: view)
        
        //Init
        ideaBubble = childNode(withName: "ideaBubble") as! SKSpriteNode
        questionBubble = childNode(withName: "questionBubble") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if ideaBubble.contains(pos) && ideaBubble.action(forKey: "pop") == nil {
            ideaBubble.run(.sequence(popAction + [.playSoundFileNamed("Idea", waitForCompletion: true)]), withKey: "pop")
        }
        
        if questionBubble.contains(pos) && questionBubble.action(forKey: "pop") == nil {
            questionBubble.run(.sequence(popAction + [.playSoundFileNamed("Question", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
