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

protocol InteractiveNode {
    func interact()
}



struct PhysicsCategory {
    static let None:  UInt32 = 0
    static let Cat:   UInt32 = 0b1
    static let Block: UInt32 = 0b10
    static let Bed:   UInt32 = 0b100
}

class GameScene: SKScene {
    
    
    var bedNode: BedNode!
    var catNode: CatNode!
    
    
    override func didMove(to view: SKView) {
        
        //playBackgroundMusic(filename: "backgroundMusic.mp3")
        
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        enumerateChildNodes(withName: "//*") { (node: SKNode, _ ) in
            
            print(node.name)
             
            if let customNode = node as? CustomNodeEvents {
                customNode.didMoveToScene()
            }
        }
        
        
        bedNode = childNode(withName: "bed") as! BedNode
        catNode = childNode(withName: "//cat_body") as! CatNode
        
        
      
        
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
