//
//  GameScene.swift
//  CatNap
//
//  Created by Владимир Невинный on 23.01.16.
//  Copyright (c) 2016 Владимир Невинный. All rights reserved.
//

import SpriteKit

protocol CustomNodeEvents {
    func didMoveToScene()
}

class GameScene: SKScene {
    
    
    var bedNode: BedNode!
    var catNode: catNode!
    
    
    override func didMove(to view: SKView) {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        enumerateChildNodes(withName: "//*") { (node: SKNode, _ ) in
            if let customNode = node as? CustomNodeEvents {
                customNode.didMoveToScene()
            }
        }
        
        
        bedNode = childNodeWithName("bed") as! BedNode
        catNode = childNodeWithName("//cat_body") as! CatNode
        
        
        bedNode.setScale(1.5)
        catNode.setScale*1.5)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.location(in: self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration:1)
//            
//            sprite.run(SKAction.repeatForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
