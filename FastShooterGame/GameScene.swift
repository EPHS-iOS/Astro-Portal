//
//  GameScene.swift
//  FastShooterGame
//
//  Created by 64011731 on 2/22/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var player = SKSpriteNode(color: UIColor.red, size: CGSize(width: 100, height: 100))
    let right = SKSpriteNode(imageNamed: "right")
    let left = SKSpriteNode(imageNamed: "left")
    let jump = SKSpriteNode(imageNamed: "jump")
    
    override func didMove(to view: SKView) {
        
//        player = SKSpriteNode()
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.position = CGPoint(x:0, y: 0)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
//        player.physicsBody = SKPhysicsBody(texture: player.texture!, alphaThreshold: 0.7, size: (player.texture!.size()))
//        player.physicsBody?.affectedByGravity = false
//        player.physicsBody?.categoryBitMask = PhysicsCategories.player
//        player.physicsBody?.collisionBitMask = PhysicsCategories.None
//        player.physicsBody?.contactTestBitMask = PhysicsCategories.rock
        player.setScale(1) //75
        self.addChild(player)
        right.position = CGPoint(x: self.size.width * -0.2, y: self.size.height * -0.4)
        right.zPosition = 3
        self.addChild(right)
        
        
        left.position = CGPoint(x: self.size.width * -0.3, y: self.size.height * -0.4)
        left.zPosition = 3
        self.addChild(left)
        
        
        jump.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * -0.4)
        jump.zPosition = 3
        self.addChild(jump)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            
            if right.contains(pointOfTouch){
                player.position.x += 20
            }
            if left.contains(pointOfTouch){
                player.position.x -= 20
            }else if jump.contains(pointOfTouch){
                player.position.y += 20
            }
        }
    }
}
    
   
