



//
//  GameScene.swiftgi

//
//  Created by 64011731 on 2/22/21.
//
import Foundation
import SpriteKit
import GameplayKit
import AudioToolbox

class level3: SKScene, SKPhysicsContactDelegate {
    var impulseCount : Int?
    var utouch : Bool?
    var utouch2 : Bool?
    var rtouch2 : Bool?
    var finishedLevel : Bool?
    var initialPosition : CGPoint?
    var reset : Bool?
    var rtouch : Bool?
    var ltouch: Bool?
    var ltouch2:Bool?
    var hasKey : Bool?
    var halfWidth : CGFloat?
    var isthere : Bool?
    var isthereLeft : Bool?
    var isthereground : Bool?
    var tileSize : CGSize?
    var halfHeight : CGFloat?
    var isOnEdge: Bool?
    var isOnEdgeLeft : Bool?
    var x : CGFloat?
    var y : CGFloat?
    var istouching : Bool?
    var nodesList = [SKShapeNode]()
    var nodesListLeft = [SKShapeNode]()
    var nodesListGround = [SKShapeNode]()
    var tileMap : SKTileMapNode?
    //var edgeMap : SKTile
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
        static let mapEdge : UInt32 = 0b110
        static let saw : UInt32 = 0b111
        
    }
    override func didMove(to view: SKView) {
        scene!.enumerateChildNodes(withName: "saw") {
            (node, stop) in
   
          node.run(SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat.pi )*2, duration: 10)))
   
           //hi
        }
        impulseCount=0
        view.isMultipleTouchEnabled=true
        reset = false
    isOnEdgeLeft=false
       isOnEdge=false
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
         tileMap = (self.childNode(withName: "Tile Map Node") as? SKTileMapNode)!
        tileSize = tileMap?.tileSize
       halfWidth = CGFloat(tileMap!.numberOfColumns) / 2.0 * tileSize!.width
        halfHeight = CGFloat(tileMap!.numberOfRows) / 2.0 * tileSize!.height
      
        for col in 0..<tileMap!.numberOfColumns {
            for row in 0..<tileMap!.numberOfRows {
                let tileDefinition = tileMap!.tileDefinition(atColumn: col, row: row)
                 let isCobblestone = tileDefinition?.userData?["Cobblestone"] as? Bool
                 if (isCobblestone ?? false) {
                 x = CGFloat(col) * tileSize!.width - halfWidth!
                  y = CGFloat(row) * tileSize!.height - halfHeight!
                    let rect = CGRect(x: 0, y: 0, width: tileSize!.width, height: tileSize!.height)
                     let tileNode = SKShapeNode(rect: rect)
                     tileNode.position = CGPoint(x: x!, y: y!)
                    tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: tileSize!, center: CGPoint(x: tileSize!.width / 2.0, y: tileSize!.height / 2.0))
                     tileNode.physicsBody?.isDynamic = false
               
                    
                    //tileNode.physicsBody?.usesPreciseCollisionDetection = true
                     tileNode.alpha=0
                     tileNode.physicsBody?.categoryBitMask = PhysicsCategory.map
                     tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.none
                
                    tileMap!.addChild(tileNode)
                    nodesListGround.append(tileNode)
                 }
             }
         }

      
        for col in 0..<tileMap!.numberOfColumns {
            for row in 0..<tileMap!.numberOfRows {
                let tileDefinition = tileMap!.tileDefinition(atColumn: col, row: row)
                let isCobblestone = tileDefinition?.userData?["edge"] as? Bool
                if (isCobblestone ?? false) {
                     x = CGFloat(col) * tileSize!.width - halfWidth!
                    y = CGFloat(row) * tileSize!.height - halfHeight!
                    let rect = CGRect(x: 0, y: 0, width: tileSize!.width, height: tileSize!.height)
                    let tileNode = SKShapeNode(rect: rect)
                    tileNode.position = CGPoint(x: x!, y: y!)
                   tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: CGSize(width: tileSize!.width, height: tileSize!.height), center: CGPoint(x: tileSize!.width / 2.0, y: tileSize!.height / 2.0))
                   tileNode.physicsBody?.isDynamic = false
           
                        tileNode.physicsBody?.usesPreciseCollisionDetection = true
                    tileNode.alpha=1
                   tileNode.physicsBody?.categoryBitMask = PhysicsCategory.mapEdge
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.none
                    nodesList.append(tileNode)
                    tileMap!.addChild(tileNode)
                    
                }
            }
        }
        for col in 0..<tileMap!.numberOfColumns {
            for row in 0..<tileMap!.numberOfRows {
                let tileDefinition = tileMap!.tileDefinition(atColumn: col, row: row)
                let isCobblestone = tileDefinition?.userData?["leftEdge"] as? Bool
                if (isCobblestone ?? false) {
                     x = CGFloat(col) * tileSize!.width - halfWidth!
                    y = CGFloat(row) * tileSize!.height - halfHeight!
                    let rect = CGRect(x: 0, y: 0, width: tileSize!.width, height: tileSize!.height)
                    let tileNode = SKShapeNode(rect: rect)
                    tileNode.position = CGPoint(x: x!, y: y!)
                   tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: CGSize(width: tileSize!.width, height: tileSize!.height), center: CGPoint(x: tileSize!.width / 2.0, y: tileSize!.height / 2.0))
                   tileNode.physicsBody?.isDynamic = false
                    tileNode.alpha=1
                   tileNode.physicsBody?.categoryBitMask = PhysicsCategory.mapEdge
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.none
                    nodesListLeft.append(tileNode)
                    tileMap!.addChild(tileNode)
                    
                }
            }
        }
        key = childNode(withName: "key") as?SKSpriteNode
 key?.physicsBody?.isDynamic = false
     
       key?.physicsBody?.categoryBitMask=PhysicsCategory.key
       key?.physicsBody?.contactTestBitMask=PhysicsCategory.player
      door = childNode(withName: "door") as?SKSpriteNode
    //    door?.physicsBody?.usesPreciseCollisionDetection=true
        door?.physicsBody?.categoryBitMask=PhysicsCategory.door
        door?.physicsBody?.contactTestBitMask=PhysicsCategory.none
        player?.setScale(1) //75
        player?.physicsBody?.categoryBitMask=PhysicsCategory.player
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.map
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.key
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.door
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.mapEdge
        player?.physicsBody?.contactTestBitMask=PhysicsCategory.saw
        initialPosition = player?.position
        
       // player?.physicsBody?.usesPreciseCollisionDetection = true
        right.position = CGPoint(x: self.size.width * -0.2, y: self.size.height * -0.4)
        right.zPosition = 3
        right.size=CGSize(width:self.size.width/3,height:self.size.height/3)
        right.alpha = 0.8
        self.addChild(right)
        
   
        left.position = CGPoint(x: self.size.width * -0.3, y: self.size.height * -0.4)
        left.zPosition = 3
        left.size=CGSize(width:self.size.width/3,height:self.size.height/3)
        left.alpha = 0.8
        self.addChild(left)
        
        
        jump.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * -0.4)
        jump.zPosition = 3
       jump.size=CGSize(width: self.size.width/4,height:self.size.height/2)
        jump.alpha = 0.8
        self.addChild(jump)
      
   // self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
     //   run(SKAction.repeatForever(
       //   SKAction.sequence([
         //   SKAction.run(addBullet),
          //  SKAction.wait(forDuration:bulletDuration)
         // ])
      //  ))
        

          
    }
    func centerOnNode(node:SKNode){
        
        self.camera!.run(SKAction.move(to: CGPoint(x:node.position.x, y:node.position.y), duration: 0.3))
        self.right.run(SKAction.move(to: CGPoint(x:node.position.x-300, y:node.position.y-300), duration: 0.3))
        self.left.run(SKAction.move(to: CGPoint(x:node.position.x-750, y:node.position.y-300), duration: 0.3))
       self.jump.run(SKAction.move(to: CGPoint(x:node.position.x+400, y:node.position.y-300), duration: 0.3))
       
    }
    
  
    override func didFinishUpdate() {
  //  centerOnNode(node: player!)
    }
    override func update(_ currentTime: TimeInterval){
      
        
        if(reset==true){
         
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            player?.position=initialPosition!
            rtouch=false
               ltouch=false
               rtouch2=false
               ltouch2=false
            reset = false
        }
        isthere=false
        for i in 0..<nodesList.count{
           
            if(nodesList[i].frame.intersects(player!.frame)==true){
            isthere=true
              isOnEdge=true
                //  print("Rtrue")
                
          }
            if(i==nodesList.count-1&&isthere==false){
           //    print("Rfalse")
                isOnEdge=false
              //  utouch2=false
                rtouch2=false
            }
           
        }
        isthereLeft=false
        for i in 0..<nodesListLeft.count{
           
            if(nodesListLeft[i].frame.intersects(player!.frame)==true){
            isthereLeft=true
              isOnEdgeLeft=true
         //  print("true")
                
          }
            if(i==nodesListLeft.count-1&&isthereLeft==false){
          //    print("false")
                isOnEdgeLeft=false
             //   utouch2=false
                ltouch2=false
            }
           
        }
   
        
        if(isOnEdge==false){
            jump.alpha=0.5
        }else {
            jump.alpha=1
        }
        
        if(rtouch==true){
            
            player?.position.x+=10
            
            print("rdoing")
        }
        if(ltouch==true){
            player?.position.x-=10
        }
        
        if(utouch==true){
            
           
            player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 550))
            utouch=false
        
            
            print("impulse")
        }
        if(rtouch2==true&&isOnEdge==true){
            player?.physicsBody?.applyImpulse(CGVector(dx:0,dy:700))
          player?.position.x+=20
            //player?.physicsBody?.applyImpulse(CGVector(dx:30,dy:0))
            
        }
        if(utouch2==true&&(isOnEdge==true||isOnEdgeLeft==true)){
           
         //   self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
            player?.position.y+=20
           
            print("upp")
        }
        if(ltouch2==true&&isOnEdgeLeft==true){
            player?.physicsBody?.applyImpulse(CGVector(dx:0,dy:700))
            player?.position.x-=20
           //player?.physicsBody?.applyImpulse(CGVector(dx:-30,dy:0))
          
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

                 
                if(isOnEdge==false){
                 if right.contains(pointOfTouch){

                 rtouch=true
                  
                 }
                }
                if(isOnEdge==true){
                    if right.contains(pointOfTouch){
                       rtouch=true
                    rtouch2=true
                     
                    }
                }
                if(isOnEdgeLeft==false){
                 if left.contains(pointOfTouch){
                     ltouch=true

                 }
                }
                if(isOnEdgeLeft==true){
                    if left.contains(pointOfTouch){
                        
                        ltouch=true
                        ltouch2=true
                    }
                }
               
                if(isOnEdge==false&&isOnEdgeLeft==false){
                if jump.contains(pointOfTouch)&&istouching==true{
                utouch=true
                    istouching=false

                }
                }
                if(isOnEdge==true||isOnEdgeLeft==true){
                    if jump.contains(pointOfTouch){
                        print("test")
                    utouch2=true
                        utouch = false
                        istouching=false
                    }
                }
             }

         }
    //hi
   
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                   
                    for touch: AnyObject in touches{

                        let pointOfTouch = touch.location(in: self)

                      
                    
                    
                        if(left.contains(pointOfTouch)==false&&right.contains(pointOfTouch)==false&&jump.contains(pointOfTouch)==false){
                            ltouch=false
                            ltouch2=false
                            rtouch=false
                            rtouch2=false
                            utouch=false
                            utouch2=false
                        }
                    
                    }

                }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

           for touch: AnyObject in touches{

               let pointOfTouch = touch.location(in: self)

           

               if right.contains(pointOfTouch){

             

        
                rtouch=false
               }

               if left.contains(pointOfTouch){

                 //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch=false
                   

               }
            if left.contains(pointOfTouch){

              //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch2=false
                

            }
               if jump.contains(pointOfTouch){

utouch=false
                   

               }
           
            if jump.contains(pointOfTouch){

utouch2=false
                

            }
         
           
                if(right.contains(pointOfTouch)){
                    rtouch2=false
                }
            
           }

           

       }
    func didBegin(_ contact: SKPhysicsContact) {
        print("check")
       if contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.map{
istouching=true
            
    
      //  self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.key )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.key && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player)){
            print("key")
       key?.removeFromParent()
    
            hasKey=true
            
        }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.saw )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.saw && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player)){
        reset = true
            print("saw")
            
            
         
            
        }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.door && hasKey==true)||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.door && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && hasKey==true)){
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
        if contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.mapEdge{
            print("edge")
    //  istouching=false
        }
    }
}
    
   