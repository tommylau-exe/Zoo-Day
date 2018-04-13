//
//  TitleScene.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/15/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

class TitleScene: GameScene {
    
    var title: SKSpriteNode!
    var info: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        pageID = Page.Title
        super.didMove(to: view)
        
        //Init
        nextButton.isHidden = true
        backButton.isHidden = true
        readButton.isHidden = false
        title = childNode(withName: "title") as! SKSpriteNode
        info = childNode(withName: "info") as! SKSpriteNode
    }
    
    override func touchDown(atPoint pos: CGPoint) {
        super.touchDown(atPoint: pos)
        
        if info.contains(pos) {
            self.view?.window?.rootViewController?.performSegue(withIdentifier: "showLegal", sender: nil)
        } else if title.contains(pos) && title.action(forKey: "pop") == nil {
            title.run(.sequence([.playSoundFileNamed("Pop", waitForCompletion: false)] + popAction), withKey: "pop")
        }
    }
    
}
