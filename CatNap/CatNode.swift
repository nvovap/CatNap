//
//  CatNode.swift
//  CatNap
//
//  Created by nvovap on 7/7/16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//
import SpriteKit

class CatNode: SKSpriteNode, CustomNodeEvents {
    func didMoveToScene() {
        print("Cat added to scene")
        
        let catBodyTexture = SKTexture(imageNamed: "cat_body_outline")
        parent!.physicsBody = SKPhysicsBody(texture: catBodyTexture, size: catBodyTexture.size())
        parent!.physicsBody!.categoryBitMask = PhysicsCategory.Cat
        parent!.physicsBody!.collisionBitMask = PhysicsCategory.Block
        
        
        
    }
    
}
