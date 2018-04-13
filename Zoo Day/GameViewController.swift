//
//  GameViewController.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/13/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let launchedBefore = defaults.bool(forKey: "launchedBefore")
        if !launchedBefore {
            defaults.set(false, forKey: "mute")
            defaults.set(true, forKey: "launchedBefore")
        }
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "TitleScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
