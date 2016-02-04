//: Playground - noun: a place where people can play

import UIKit
import SpriteKit
import XCPlayground


let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 480, height: 320))

let scene = SKScene(size: CGSize(width: 480, height: 320))
scene.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
scene.physicsBody = SKPhysicsBody(edgeLoopFromRect: scene.frame)

sceneView.showsFPS = true
sceneView.presentScene(scene)

XCPShowView("MyScene", view: sceneView)





let square = SKSpriteNode(imageNamed: "square")
square.name = "shape"
square.position = CGPoint(x: scene.size.width * 0.25, y: scene.size.height * 0.50)



let circle = SKSpriteNode(imageNamed: "circle")
circle.name = "shape"
circle.position = CGPoint(x: scene.size.width * 0.50, y: scene.size.height * 0.50)

let triangle = SKSpriteNode(imageNamed: "triangle")
triangle.name = "shape"
triangle.position = CGPoint(x: scene.size.width * 0.75, y: scene.size.height * 0.50)

var trianglePath = CGPathCreateMutable()
CGPathMoveToPoint(trianglePath, nil, -triangle.size.width/2, -triangle.size.height/2)
CGPathAddLineToPoint(trianglePath, nil, triangle.size.width/2, -triangle.size.height/2)
CGPathAddLineToPoint(trianglePath, nil, 0, triangle.size.height/2)
CGPathAddLineToPoint(trianglePath, nil, -triangle.size.width/2, -triangle.size.height/2)

triangle.physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)




scene.addChild(triangle)
scene.addChild(circle)
scene.addChild(square)


circle.physicsBody = SKPhysicsBody(circleOfRadius: circle.size.width/2)
square.physicsBody = SKPhysicsBody(rectangleOfSize: square.frame.size)

func spawnSand() {
    let sand = SKSpriteNode(imageNamed: "sand")
    
    sand.position = CGPoint(x:random( min: 0.0, max: scene.size.width) , y: random( min: 0.0, max: scene.size.height))
    
    sand.physicsBody = SKPhysicsBody(circleOfRadius: sand.size.width/2)
    
    sand.name = "sand"
    scene.addChild(sand)
}

delay(seconds: 2.0) { () -> () in
    scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    
    scene.runAction(SKAction.repeatAction(SKAction.sequence([SKAction.runBlock(spawnSand), SKAction.waitForDuration(0.1)]), count: 100))
}






