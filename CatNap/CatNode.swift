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
    }
    
}
