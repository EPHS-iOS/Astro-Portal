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
    
    var player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        player = SKSpriteNode()
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.position = CGPoint(x:0, y: -200)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(texture: player.texture!, alphaThreshold: 0.7, size: (player.texture!.size()))
        player.physicsBody?.affectedByGravity = false
//        player.physicsBody?.categoryBitMask = PhysicsCategories.player
//        player.physicsBody?.collisionBitMask = PhysicsCategories.None
//        player.physicsBody?.contactTestBitMask = PhysicsCategories.rock
        player.setScale(1) //75
        self.addChild(player)
        
    }
    }
    
    
   
