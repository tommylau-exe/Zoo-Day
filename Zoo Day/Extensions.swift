//
//  Extensions.swift
//  Zoo Day
//
//  Created by Thomas Lauerman on 2/26/17.
//  Copyright © 2017 Thomas Lauerman. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    func getRightBound() -> CGFloat {
        return position.x + (size.width / 2)
    }
    
    func getLeftBound() -> CGFloat {
        return position.x - (size.width / 2)
    }
    
    func getTopBound() -> CGFloat {
        return position.y + (size.height / 2)
    }
    
    func getBottonBound() -> CGFloat {
        return position.y - (size.height / 2)
    }
}
