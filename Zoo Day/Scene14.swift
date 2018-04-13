//
//  Scene14.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/27/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene14: GameScene {
    
    var theEnd: SKSpriteNode!
    
    var touchPoint: CGPoint?
    
    override func didMove(to view: SKView) {
        pageID = Page.Fourteen
        super.didMove(to: view)
        
        //Init
        nextButton.isHidden = true
        
        theEnd = childNode(withName: "theEnd") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if theEnd.contains(pos) {
            touchPoint = pos
        }
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        super.touchMoved(toPoint: pos)
        
        if touchPoint != nil {
            touchPoint = pos
        }
    }
    
    override func touchUp(atPoint pos: CGPoint) {
        super.touchUp(atPoint: pos)
        
        touchPoint = nil
        theEnd.run(.rotate(toAngle: 0, duration: 0.25, shortestUnitArc: true))
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        guard let touchPoint = touchPoint else { return }
        
        let origin = theEnd.position
        
        let deltaX = touchPoint.x - origin.x
        let deltaY = touchPoint.y - origin.y
        
        let angle:CGFloat = atan2(deltaY, deltaX)
        
        theEnd.zRotation = angle
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return touchPoint == nil
    }
    
}
