//
//  Scene13.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/27/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class Scene13: GameScene {
    
    var flamingo: SKSpriteNode!
    var butterfly: SKSpriteNode!
    var monkey: SKSpriteNode!
    var bunny: SKSpriteNode!
    var bear: SKSpriteNode!
    var turtle: SKSpriteNode!
    var bird: SKSpriteNode!
    var penguin: SKSpriteNode!
    var chameleon: SKSpriteNode!
    var gator: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Thirteen
        narrationDelay = 6.5
        super.didMove(to: view)
        
        //Init
        flamingo = childNode(withName: "flamingo") as! SKSpriteNode
        butterfly = childNode(withName: "butterfly") as! SKSpriteNode
        monkey = childNode(withName: "monkey") as! SKSpriteNode
        bunny = childNode(withName: "bunny") as! SKSpriteNode
        bear = childNode(withName: "bear") as! SKSpriteNode
        turtle = childNode(withName: "turtle") as! SKSpriteNode
        bird = childNode(withName: "bird") as! SKSpriteNode
        penguin = childNode(withName: "penguin") as! SKSpriteNode
        chameleon = childNode(withName: "chameleon") as! SKSpriteNode
        gator = childNode(withName: "gator") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if flamingo.contains(pos) && flamingo.action(forKey: "pop") == nil {
            flamingo.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if butterfly.contains(pos) && butterfly.action(forKey: "pop") == nil {
            butterfly.run(.sequence(popAction + [.playSoundFileNamed("Rustling", waitForCompletion: true)]), withKey: "pop")
        }
        
        if monkey.contains(pos) && monkey.action(forKey: "pop") == nil {
            monkey.run(.sequence(popAction + [.playSoundFileNamed("Monkey", waitForCompletion: true)]), withKey: "pop")
        }
        
        if bunny.contains(pos) && bunny.action(forKey: "pop") == nil {
            bunny.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if bear.contains(pos) && bear.action(forKey: "pop") == nil {
            bear.run(.sequence(popAction + [.playSoundFileNamed("Rustling", waitForCompletion: true)]), withKey: "pop")
        }
        
        if turtle.contains(pos) && turtle.action(forKey: "pop") == nil {
            turtle.run(.sequence(popAction + [.playSoundFileNamed("Sploosh", waitForCompletion: true)]), withKey: "pop")
        }
        
        if bird.contains(pos) && bird.action(forKey: "pop") == nil {
            bird.run(.sequence(popAction + [.playSoundFileNamed("Squawk", waitForCompletion: true)]), withKey: "pop")
        }
        
        if penguin.contains(pos) && penguin.action(forKey: "pop") == nil {
            penguin.run(.sequence(popAction + [.playSoundFileNamed("Penguin", waitForCompletion: true)]), withKey: "pop")
        }
        
        if chameleon.contains(pos) && chameleon.action(forKey: "pop") == nil {
            chameleon.run(.sequence(popAction + [.playSoundFileNamed("Pop", waitForCompletion: true)]), withKey: "pop")
        }
        
        if gator.contains(pos) && gator.action(forKey: "pop") == nil {
            gator.run(.sequence(popAction + [.playSoundFileNamed("Sploosh", waitForCompletion: true)]), withKey: "pop")
        }
    }
    
}
