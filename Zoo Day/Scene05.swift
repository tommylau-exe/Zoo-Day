//
//  Scene05.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene05: GameScene {
    
    var car: SKSpriteNode!
    var grass1: SKSpriteNode!
    var grass2: SKSpriteNode!
    
    let grassSpeed: CGFloat = 20
    
    override func didMove(to view: SKView) {
        pageID = Page.Five
        super.didMove(to: view)
        
        //Init
        car = childNode(withName: "car") as! SKSpriteNode
        grass1 = childNode(withName: "grass1") as! SKSpriteNode
        grass2 = childNode(withName: "grass2") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if car.contains(pos) && car.action(forKey: "honk") == nil {
            car.run(.sequence(popAction + [.playSoundFileNamed("HonkShort", waitForCompletion: true)]), withKey: "honk")
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        let sceneLeftBound = -(self.size.width / 2)
        
        if grass1.getRightBound() > sceneLeftBound {
            grass1.position.x -= grassSpeed
        } else {
            grass1.position.x = 1762
        }
        
        if grass2.getRightBound() > sceneLeftBound {
            grass2.position.x -= grassSpeed
        } else {
            grass2.position.x = 1762
        }
    }
    
}
