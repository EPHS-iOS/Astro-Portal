//
//  GameScene.swift
//  FastShooterGame
//
//  Created by 64011731 on 2/22/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var utouch : Bool?
    var finishedLevel : Bool?
    var rtouch : Bool?
    var ltouch: Bool?
    var hasKey : Bool?
    var istouching : Bool?
    var cameraNode: SKCameraNode?
    var player : SKSpriteNode?
    var door : SKSpriteNode?
    var bulletDuration = 3.0
   // var gun1 : SKSpriteNode?
    let right = SKSpriteNode(imageNamed: "right")
    let left = SKSpriteNode(imageNamed: "left")
    let jump = SKSpriteNode(imageNamed: "jump")
    var key : SKSpriteNode?
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let bullet   : UInt32 = 0b1       // 1
        static let player : UInt32 = 0b10
        static let map : UInt32 = 0b11
        static let key : UInt32 = 0b100
        static let door : UInt32 = 0b101
        
        
    }
    override func didMove(to view: SKView) {
        finishedLevel=false
        hasKey=false
  //      istouching=false
        physicsWorld.contactDelegate = self
        
        player = childNode(withName: "player") as?SKSpriteNode
        cameraNode = childNode(withName: "camera") as?SKCameraNode
    //   gun1 = childNode(withName: "gun wall") as?SKSpriteNode
        
//        player = SKSpriteNode()

       
//        player.physicsBody = SKPhysicsBody(texture: player.texture!, alphaThreshold: 0.7, size: (player.texture!.size()))

//        player.physicsBody?.categoryBitMask = PhysicsCategories.player
//        player.physicsBody?.collisionBitMask = PhysicsCategories.None
//        player.physicsBody?.contactTestBitMask = PhysicsCategories.rock
       
        //self.addChild(player!)
        let tileMap = (self.childNode(withName: "Tile Map Node") as? SKTileMapNode)!
         let tileSize = tileMap.tileSize
         let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
         let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
      
         for col in 0..<tileMap.numberOfColumns {
             for row in 0..<tileMap.numberOfRows {
                 let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row)
                 let isCobblestone = tileDefinition?.userData?["Cobblestone"] as? Bool
                 if (isCobblestone ?? false) {
                     let x = CGFloat(col) * tileSize.width - halfWidth
                     let y = CGFloat(row) * tileSize.height - halfHeight
                     let rect = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                     let tileNode = SKShapeNode(rect: rect)
                     tileNode.position = CGPoint(x: x, y: y)
                     tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: tileSize, center: CGPoint(x: tileSize.width / 2.0, y: tileSize.height / 2.0))
                     tileNode.physicsBody?.isDynamic = false
                    tileNode.physicsBody?.friction=0.1
                    tileNode.physicsBody?.usesPreciseCollisionDetection = true
                     tileNode.alpha=0
                     tileNode.physicsBody?.categoryBitMask = PhysicsCategory.map
                     tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.none
                     tileMap.addChild(tileNode)
                 }
             }
         }
        key = childNode(withName: "key") as?SKSpriteNode
        key?.physicsBody?.usesPreciseCollisionDetection=true
        key?.physicsBody?.categoryBitMask=PhysicsCategory.key
        key?.physicsBody?.contactTestBitMask=PhysicsCategory.none
      door = childNode(withName: "door") as?SKSpriteNode
        door?.physicsBody?.usesPreciseCollisionDetection=true
        door?.physicsBody?.categoryBitMask=PhysicsCategory.door
        door?.physicsBody?.contactTestBitMask=PhysicsCategory.none
        player?.setScale(1) //75
        player?.physicsBody?.categoryBitMask=PhysicsCategory.player
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.map
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.key
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.door
        player?.physicsBody?.usesPreciseCollisionDetection = true
        right.position = CGPoint(x: self.size.width * -0.2, y: self.size.height * -0.4)
        right.zPosition = 3
        right.size=CGSize(width:self.size.width/4,height:self.size.height/4)
        right.alpha = 0.8
        self.addChild(right)
        
        
        left.position = CGPoint(x: self.size.width * -0.3, y: self.size.height * -0.4)
        left.zPosition = 3
        left.size=CGSize(width:self.size.width/4,height:self.size.height/4)
        left.alpha = 0.8
        self.addChild(left)
        
        
        jump.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * -0.4)
        jump.zPosition = 3
       jump.size=CGSize(width: self.size.width/5,height:self.size.height/3)
        jump.alpha = 0.8
        self.addChild(jump)
      
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
     //   run(SKAction.repeatForever(
       //   SKAction.sequence([
         //   SKAction.run(addBullet),
          //  SKAction.wait(forDuration:bulletDuration)
         // ])
      //  ))
        

          
    }
    func centerOnNode(node:SKNode){
        self.camera!.run(SKAction.move(to: CGPoint(x:node.position.x, y:node.position.y), duration: 0.3))
        self.right.run(SKAction.move(to: CGPoint(x:node.position.x-450, y:node.position.y-300), duration: 0.3))
        self.left.run(SKAction.move(to: CGPoint(x:node.position.x-700, y:node.position.y-300), duration: 0.3))
       self.jump.run(SKAction.move(to: CGPoint(x:node.position.x+400, y:node.position.y-300), duration: 0.3))
       
    }
    override func didFinishUpdate() {
  //  centerOnNode(node: player!)
    }
    override func update(_ currentTime: TimeInterval){
        if(istouching==false){
            jump.alpha=0.5
        }else{
            jump.alpha=1
        }
        if(rtouch==true){
            player?.position.x+=5
        }
        if(ltouch==true){
            player?.position.x-=5
        }
        if(utouch==true){
            player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
         utouch=false
            
        }
 
        centerOnNode(node: player!)
    }
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    func addBullet(){
     //   let ran = random(min: -100, max: 100)
     //   let location = CGPoint(x:gun1!.position.x,y:gun1!.position.y+ran)
    //    let bullet = SKSpriteNode(imageNamed: "laser")
      //  bullet.physicsBody = SKPhysicsBody(circleOfRadius: 25)
      //  bullet.physicsBody?.isDynamic = false // 2
      //  bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // 3
    //   bullet.physicsBody?.contactTestBitMask = PhysicsCategory.player // 4
    //   bullet.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
      //  bullet.size = CGSize(width:50,height:50)
      //  bullet.position=CGPoint(x:gun1!.position.x,y:gun1!.position.y-150+ran)
     //addChild(bullet)
      //  let duration = random(min:CGFloat(10), max:CGFloat(15))
    //    let actionMove = SKAction.move(to: CGPoint(x: -10000, y:gun1!.position.y-150+ran), duration:TimeInterval(duration))
    //    let moveDone = SKAction.removeFromParent()
     //   bullet.run(SKAction.sequence([actionMove,moveDone]))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           
            for touch: AnyObject in touches{

                let pointOfTouch = touch.location(in: self)

                

                if right.contains(pointOfTouch){

                rtouch=true
                 
                }

                if left.contains(pointOfTouch){
                    ltouch=true

                }else if jump.contains(pointOfTouch)&&istouching==true{
               utouch=true

                    istouching=false


                }

            }

        }
    //hi

        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

            for touch: AnyObject in touches{

                let pointOfTouch = touch.location(in: self)

            

                if right.contains(pointOfTouch){

              

                    player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
rtouch=false
                }

                if left.contains(pointOfTouch){

                  //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
 ltouch=false
                    

                }
                if jump.contains(pointOfTouch){

utouch=false
                    

                }
            }

            

        }
}
    
   
extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("check")
        if contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.map{
            print("yes")
            istouching=true
        }
        if contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.key{
            print("key")
            key?.removeFromParent()
            hasKey=true
        }
        if contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.door && hasKey==true{
            print("finishLevel")
            finishedLevel=true
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                if let scene = SKScene(fileNamed: "level") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                view.showsPhysics = false
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true //hi
                view.isMultipleTouchEnabled = true
            }
           
        }
    }

}
