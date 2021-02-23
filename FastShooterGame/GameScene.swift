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
    
    override func didMove(to view: SKView) {
        
//        player = SKSpriteNode()
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.position = CGPoint(x:0, y: 0)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
//        player.physicsBody = SKPhysicsBody(texture: player.texture!, alphaThreshold: 0.7, size: (player.texture!.size()))
        player.physicsBody?.affectedByGravity = false
//        player.physicsBody?.categoryBitMask = PhysicsCategories.player
//        player.physicsBody?.collisionBitMask = PhysicsCategories.None
//        player.physicsBody?.contactTestBitMask = PhysicsCategories.rock
        player.setScale(1) //75
        self.addChild(player)
        
    }
    }
    
    
   
