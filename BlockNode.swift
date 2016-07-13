//
//  BedNode.swift
//  CatNap
//
//  Created by nvovap on 7/13/16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import SpriteKit

class BlockNode: SKSpriteNode, CustomNodeEvents, InteractiveNode {
    
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
    }
    
    func interact() {
        isUserInteractionEnabled = false
        
        run(SKAction.sequence([SKAction.playSoundFileNamed("pop.mp3", waitForCompletion: false), SKAction.scale(to: 0.8, duration: 0.1), SKAction.removeFromParent()]))
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        print("destroy block")
        
        interact()
    }
}
