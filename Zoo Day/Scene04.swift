//
//  Scene04.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/24/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene04: GameScene {
    
    var plant: SKSpriteNode!
    var picture: SKSpriteNode!
    
    var touchPoint: CGPoint?
    let plantPositions: [CGFloat] = [55, 75, 95, 128]
    var plantDoneGrowing = false
    
    override func didMove(to view: SKView) {
        pageID = Page.Four
        super.didMove(to: view)
        
        //Init
        plant = childNode(withName: "plant") as! SKSpriteNode
        picture = childNode(withName: "picture") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if let body = physicsWorld.body(at: pos) {
            if body.node?.name == "picture" {
                touchPoint = pos
                
                body.affectedByGravity = false
                body.velocity = CGVector.zero
                body.angularVelocity = 0
            }
        }
        
        if plant.contains(pos) {
            if !plantDoneGrowing && plant.action(forKey: "grow") == nil {
                growPlant()
            } else if plant.action(forKey: "plantPop") == nil {
                plant.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "plantPop")
            }
        }
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        if touchPoint != nil {
            touchPoint = pos
        }
    }
    
    override func touchUp(atPoint point: CGPoint) {
        picture.physicsBody?.affectedByGravity = true
        touchPoint = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard let touchPoint = touchPoint else { return }
        
        let origin = picture.position
        
        let deltaX = touchPoint.x - origin.x
        let deltaY = touchPoint.y - origin.y
        
        let angle:CGFloat = atan2(deltaY, deltaX) + CGFloat.pi / 2
        
        picture.zRotation = angle
    }
    
    //Cancel gestures
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return touchPoint == nil
    }
    
    private func growPlant() {
        for index in 0..<plantPositions.count {
            if plant.position.y == plantPositions[index] {
                if index == plantPositions.count - 1 { plantDoneGrowing = true; return }
                
                plant.run(.sequence([.playSoundFileNamed("Slide", waitForCompletion: false), .moveTo(y: plantPositions[index + 1], duration: 0.8)]), withKey: "grow")
            }
        }
    }
    
}
