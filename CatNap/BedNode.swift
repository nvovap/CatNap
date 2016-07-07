//
//  BedNode.swift
//  CatNap
//
//  Created by nvovap on 7/7/16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import SpriteKit

class BedNode: SKSpriteNode, CustomNodeEvents {
    func didMoveToScene() {
        print("bed added to scene")
    }
    
}
