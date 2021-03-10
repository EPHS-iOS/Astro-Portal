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
    var cameraNode: SKCameraNode?
    var player : SKSpriteNode?
    let right = SKSpriteNode(imageNamed: "right")
    let left = SKSpriteNode(imageNamed: "left")
    let jump = SKSpriteNode(imageNamed: "jump")
    
    override func didMove(to view: SKView) {
        player = childNode(withName: "player") as?SKSpriteNode
        cameraNode = childNode(withName: "camera") as?SKCameraNode
       
//        player = SKSpriteNode()
        player?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player?.position = CGPoint(x:0, y: 0)
       player?.zPosition = 2
     //  player?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
//        player.physicsBody = SKPhysicsBody(texture: player.texture!, alphaThreshold: 0.7, size: (player.texture!.size()))
//        player.physicsBody?.affectedByGravity = false
//        player.physicsBody?.categoryBitMask = PhysicsCategories.player
//        player.physicsBody?.collisionBitMask = PhysicsCategories.None
//        player.physicsBody?.contactTestBitMask = PhysicsCategories.rock
        player?.setScale(1) //75
        //self.addChild(player!)
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
    func centerOnNode(node:SKNode){
        self.camera!.run(SKAction.move(to: CGPoint(x:node.position.x, y:node.position.y), duration: 0.5))
       self.right.run(SKAction.move(to: CGPoint(x:node.position.x-100, y:node.position.y-125), duration: 0.5))
        self.left.run(SKAction.move(to: CGPoint(x:node.position.x-200, y:node.position.y-125), duration: 0.5))
        self.jump.run(SKAction.move(to: CGPoint(x:node.position.x+200, y:node.position.y-125), duration: 0.5))
    }
    override func didFinishUpdate() {
    centerOnNode(node: player!)
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

            for touch: AnyObject in touches{

                let pointOfTouch = touch.location(in: self)

                

                if right.contains(pointOfTouch){

                    let jumpRightAction = SKAction.moveBy(x: 300, y: 0, duration: 0.4)

                    let right = SKAction.repeatForever(jumpRightAction)

                    player?.run(right)

                    //player.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 0))

                    //player.position.x += 20

                }

                if left.contains(pointOfTouch){

                    let jumpLeftAction = SKAction.moveBy(x: -300, y: 0, duration: 0.4)

                    let left = SKAction.repeatForever(jumpLeftAction)

                    player?.run(left)

                    //player.physicsBody?.applyImpulse(CGVector(dx: -100, dy: 0))

                    //player.position.x -= 20

                }else if jump.contains(pointOfTouch){

                    player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 75))

    //                let jumpUpAction = SKAction.moveBy(x: 0, y: 300, duration: 0.5)

    //                //let jumpDownAction = SKAction.moveBy(x: 0, y: -300, duration: 0.5)

    //                let jumpSequence = SKAction.sequence([jumpUpAction])//, jumpDownAction])

    //                player.run(jumpSequence)



                }

            }

        }
    //hi

        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

            for touch: AnyObject in touches{

                let pointOfTouch = touch.location(in: self)

            

                if right.contains(pointOfTouch){

                    let jumpRightAction = SKAction.moveBy(x: -300, y: 0, duration: 0.4)

                    let right = SKAction.repeatForever(jumpRightAction)

                    player?.run(right)

                    

                }

                if left.contains(pointOfTouch){

                    let jumpLeftAction = SKAction.moveBy(x: 300, y: 0, duration: 0.4)

                    let left = SKAction.repeatForever(jumpLeftAction)

                    player?.run(left)

                }

            }

            

        }
}
    
   

