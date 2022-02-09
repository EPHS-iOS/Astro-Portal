



//
//  GameScene.swift
//  FastShooterGame
//
//  Created by 64011731 on 2/22/21.
//
import Foundation
import SpriteKit
import GameplayKit
import AudioToolbox

class level4: SKScene, SKPhysicsContactDelegate {
    let particles = SKEmitterNode(fileNamed: "Starfield.sks")
    let highScoreLabel = SKLabelNode(fontNamed: "The Bold Font")
    var myString = SKLabelNode()
    var myPb = SKLabelNode()
    var timer3 = Timer()
    var ti = 0
    var lasercount : Bool?
    var impulseCount : Int?
    var timer = Timer()
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
    var bulletsList = [SKSpriteNode]()
    var tileMap : SKTileMapNode?
    //var edgeMap : SKTile
    let cam = SKCameraNode()
    var player : SKSpriteNode?
    var door : SKSpriteNode?
    var bulletDuration = 5.0
   // var gun1 : SKSpriteNode?
    let right = SKSpriteNode(imageNamed: "rightarrow")
    let left = SKSpriteNode(imageNamed: "leftarrow")
    let jump = SKSpriteNode(imageNamed: "jumparrow")
    var menu = SKLabelNode(text: "menu")
    var key : SKSpriteNode?
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let bullet   : UInt32 = 0b1       // 1
        static let player : UInt32 = 0b10//2
        static let map : UInt32 = 0b11//3
        static let key : UInt32 = 0b100//4
        static let door : UInt32 = 0b101//5
        static let mapEdge : UInt32 = 0b110//6
        static let saw : UInt32 = 0b111//7
        static let laser : UInt32 = 0b1000//8
    }
    let defaults = UserDefaults()
    lazy var highScoreNumber3 = defaults.integer(forKey: "highScoreSaved3")
    override func didMove(to view: SKView) {
        if highScoreNumber3 == 0{
            highScoreNumber3 = 10000000
        }
        if let musicURL = Bundle.main.url(forResource: "AstroPortalMusic", withExtension: "mp3") {
            addChild( SKAudioNode(url: musicURL))
        }
        lasercount = true
        ltouch = false
        ltouch2 = false
        utouch=false
        utouch2=false
        rtouch2=false
        rtouch=false
        scene!.enumerateChildNodes(withName: "saw") {
            (node, stop) in
   
          node.run(SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat.pi )*2, duration: 10)))
   
           
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
       
    
        self.camera = cam
        cam.xScale=3
        cam.yScale=3
    
        let constraint = SKConstraint.distance(SKRange(constantValue: 0), to: player!)
        camera!.constraints = [ constraint ]
        
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
                    tileNode.physicsBody?.collisionBitMask = PhysicsCategory.none
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.player
                
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
                    tileNode.alpha=0
                    tileNode.physicsBody?.categoryBitMask = PhysicsCategory.mapEdge
                    tileNode.physicsBody?.collisionBitMask = PhysicsCategory.none
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.player
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
                    tileNode.alpha=0
                    tileNode.physicsBody?.categoryBitMask = PhysicsCategory.mapEdge
                    tileNode.physicsBody?.collisionBitMask = PhysicsCategory.none
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategory.player
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
       // player?.physicsBody?.contactTestBitMask=PhysicsCategory.bullet
        initialPosition = player?.position
        
        let screenSize = UIScreen.main.bounds
         let screenWidth = screenSize.width
         let screenHeight = screenSize.height
        self.addChild(cam)
         right.position = CGPoint(x:camera!.position.x-(scene!.size.width)/9, y: camera!.position.y-(scene!.size.width)/5)
         right.zPosition = 3
         right.size=CGSize(width:scene!.size.width/5.5,height:scene!.size.width/8)
         right.alpha = 0.8
         cam.addChild(right)
        // left.position = CGPoint(x:camera!.position.x-(scene!.size.width), y: camera!.position.y-(scene!.size.height))
        left.position = CGPoint(x:camera!.position.x-(scene!.size.width)/3, y: camera!.position.y-(scene!.size.width)/5)
         left.zPosition = 3
        left.size=CGSize(width:scene!.size.width/5.5,height:scene!.size.width/8)
         left.alpha = 1
        cam.addChild(left)
       
         
        jump.position = CGPoint(x:camera!.position.x+(scene!.size.width)/4, y: camera!.position.y-(scene!.size.width)/5.5)
         jump.zPosition = 3
        jump.size=CGSize(width:scene!.size.width/7,height:scene!.size.width/6)
         jump.alpha = 0.8
         cam.addChild(jump)
        menu.position = CGPoint(x:camera!.position.x-(scene!.size.width)/3, y: camera!.position.y+(scene!.size.width)/5)
         menu.zPosition = 3
        menu.fontSize = scene!.size.width/19
         menu.fontColor = SKColor.white
         menu.alpha = 0.8
         cam.addChild(menu)
        myString.text = "Time: \(ti)"
        myString.fontSize = scene!.size.width/30
        myString.fontColor = SKColor.white
        myString.zPosition = 4
        myString.position = CGPoint(x:camera!.position.x-(scene!.size.width) / -2.6, y: camera!.position.y+(scene!.size.width)/4.9)
        cam.addChild(myString)
        highScoreLabel.text = "Best Time: \(highScoreNumber3)"
        highScoreLabel.fontSize = 20
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.position = CGPoint(x:camera!.position.x-(scene!.size.width) / -2.5, y: camera!.position.y+(scene!.size.width)/4)
        highScoreLabel.zPosition = 50
        cam.addChild(highScoreLabel)
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
        let timer2 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(fire2), userInfo: nil, repeats: true)
        let timer3 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tim), userInfo: nil, repeats: true)
     
   // self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
     
       
        particles!.position = CGPoint(x:player!.position.x, y:player!.position.y)
        particles!.name = "star"
        particles!.targetNode = scene

        addChild(particles!)
          
    }
    @objc func tim(){
        ti += 1
       
        
    }
    @objc func fire()
    {
        scene!.enumerateChildNodes(withName: "turret") {
            (node, stop) in
            self.addBullet(location: node.position)
           
        }
        scene!.enumerateChildNodes(withName: "UpTurret") {
            (node, stop) in
            self.addBulletUp(location: node.position)
           
        }
        scene!.enumerateChildNodes(withName: "DownTurret") {
            (node, stop) in
            self.addBulletDown(location: node.position)
           
        }
        scene!.enumerateChildNodes(withName: "LeftTurret") {
            (node, stop) in
            self.addBulletLeft(location: node.position)
           
        }
    }
    
    @objc func fire2()
    {
        if(lasercount==true){
            lasercount=false
            addLaser()
        }else{
            lasercount=true
            addLaser()
        }
       
    }

   
  
    override func didFinishUpdate() {
  //  centerOnNode(node: player!)
    }
    override func update(_ currentTime: TimeInterval){
        myString.text = "Time: \(ti)"
        particles!.position=player!.position
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
          
            player?.texture=SKTexture(imageNamed: "player_right")
            print("rdoing")
        }
        if(ltouch==true){
            player?.position.x-=10
            player?.texture=SKTexture(imageNamed: "player_left")
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
 
      
       
    }
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    func addBullet(location : CGPoint){
         let location = CGPoint(x:location.x,y:location.y)
           let bullet = SKSpriteNode(imageNamed: "laser")
          bullet.physicsBody = SKPhysicsBody(circleOfRadius: 25)
         bullet.physicsBody?.isDynamic = true // 2
          bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // 3
          bullet.physicsBody?.contactTestBitMask = PhysicsCategory.player // 4
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.map
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.mapEdge
        bullet.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
           bullet.size = CGSize(width:50,height:50)
      //  bullet.physicsBody?.mass=0
        bullet.position=CGPoint(x:location.x+110,y:location.y)
        bullet.zPosition=2
        bullet.physicsBody?.affectedByGravity=false
        addChild(bullet)
 
     
         let duration = random(min:CGFloat(10), max:CGFloat(15))
        let actionMove = SKAction.move(to: CGPoint(x: location.x+10000, y:location.y), duration:TimeInterval(duration))
        let moveDone = SKAction.removeFromParent()
        
        bullet.run((SKAction.sequence([actionMove,moveDone])))
    }
    func addBulletUp(location : CGPoint){
         let location = CGPoint(x:location.x,y:location.y)
           let bullet = SKSpriteNode(imageNamed: "laser")
          bullet.physicsBody = SKPhysicsBody(circleOfRadius: 25)
         bullet.physicsBody?.isDynamic = true // 2
          bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // 3
          bullet.physicsBody?.contactTestBitMask = PhysicsCategory.player // 4
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.map
        bullet.physicsBody?.affectedByGravity=false
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.mapEdge
        bullet.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
           bullet.size = CGSize(width:50,height:50)
        bullet.physicsBody?.mass=0
           bullet.position=CGPoint(x:location.x,y:location.y+128)
        bullet.zPosition=2
        addChild(bullet)
        
         let duration = random(min:CGFloat(10), max:CGFloat(15))
        let actionMove = SKAction.move(to: CGPoint(x: location.x, y:location.y+10000), duration:TimeInterval(duration))
        let moveDone = SKAction.removeFromParent()
        
        bullet.run((SKAction.sequence([actionMove,moveDone])))
    }
    func addBulletDown(location : CGPoint){
         let location = CGPoint(x:location.x,y:location.y)
           let bullet = SKSpriteNode(imageNamed: "laser")
          bullet.physicsBody = SKPhysicsBody(circleOfRadius: 25)
         bullet.physicsBody?.isDynamic = true // 2
        bullet.physicsBody?.affectedByGravity=false
          bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // 3
          bullet.physicsBody?.contactTestBitMask = PhysicsCategory.player // 4
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.map
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.mapEdge
        bullet.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
           bullet.size = CGSize(width:50,height:50)
        bullet.physicsBody?.mass=0
           bullet.position=CGPoint(x:location.x,y:location.y-128)
        bullet.zPosition=2
        addChild(bullet)
        
         let duration = random(min:CGFloat(10), max:CGFloat(15))
        let actionMove = SKAction.move(to: CGPoint(x: location.x, y:location.y-10000), duration:TimeInterval(duration))
        let moveDone = SKAction.removeFromParent()
        
        bullet.run((SKAction.sequence([actionMove,moveDone])))
    }
    func addBulletLeft(location : CGPoint){
         let location = CGPoint(x:location.x,y:location.y)
           let bullet = SKSpriteNode(imageNamed: "laser")
          bullet.physicsBody = SKPhysicsBody(circleOfRadius: 25)
         bullet.physicsBody?.isDynamic = true // 2
        bullet.physicsBody?.affectedByGravity=false
          bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // 3
          bullet.physicsBody?.contactTestBitMask = PhysicsCategory.player // 4
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.map
        bullet.physicsBody?.contactTestBitMask=PhysicsCategory.mapEdge
        bullet.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
           bullet.size = CGSize(width:50,height:50)
        bullet.physicsBody?.mass=0
        bullet.position=CGPoint(x:location.x-128,y:location.y)
        bullet.zPosition=2
        
        addChild(bullet)
 
     
         let duration = random(min:CGFloat(10), max:CGFloat(15))
        let actionMove = SKAction.move(to: CGPoint(x: location.x-10000, y:location.y), duration:TimeInterval(duration))
        let moveDone = SKAction.removeFromParent()
        
        bullet.run((SKAction.sequence([actionMove,moveDone])))
    }
    func addLaser (){
        if(lasercount==false){
            scene!.enumerateChildNodes(withName: "laser") {
                (node, stop) in
                node.alpha=0
                node.physicsBody?.categoryBitMask=PhysicsCategory.none
            }
        }else{
            scene!.enumerateChildNodes(withName: "laser") {
                (node, stop) in
                node.alpha=1
                node.physicsBody?.categoryBitMask=PhysicsCategory.laser
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
             for touch: AnyObject in touches{
                let pointOfTouch = touch.location(in: self.camera!)
                if menu.contains(pointOfTouch){
                    if let view = self.view {
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
                    }
                }
                 

                 
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

                        let pointOfTouch = touch.location(in: self.camera!)

                      
                    
                    
                        if(left.contains(pointOfTouch)==false&&right.contains(pointOfTouch)==false&&jump.contains(pointOfTouch)==false){
                            ltouch=false
                            ltouch2=false
                            rtouch=false
                            rtouch2=false
                            utouch=false
                            utouch2=false
                            player?.texture=SKTexture(imageNamed: "player_front")
                        }
                    
                    }

                }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

           for touch: AnyObject in touches{

            let pointOfTouch = touch.location(in: self.camera!)

           

               if right.contains(pointOfTouch){

                player?.texture=SKTexture(imageNamed: "player_front")

        
                rtouch=false
               }

               if left.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

                 //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch=false
                   

               }
            if left.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

              //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch2=false
                

            }
               if jump.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

utouch=false
                   

               }
           
            if jump.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

utouch2=false
                

            }
         
           
                if(right.contains(pointOfTouch)){
                    player?.texture=SKTexture(imageNamed: "player_front")
                    rtouch2=false
                }
            
           }

           

       }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

           for touch: AnyObject in touches{

            let pointOfTouch = touch.location(in: self.camera!)

           

               if right.contains(pointOfTouch){

                player?.texture=SKTexture(imageNamed: "player_front")

        
                rtouch=false
               }

               if left.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

                 //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch=false
                   

               }
            if left.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

              //  let jumpLeftAction = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
ltouch2=false
                

            }
               if jump.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

utouch=false
                   

               }
           
            if jump.contains(pointOfTouch){
                player?.texture=SKTexture(imageNamed: "player_front")

utouch2=false
                

            }
         
           
                if(right.contains(pointOfTouch)){
                    player?.texture=SKTexture(imageNamed: "player_front")
                    rtouch2=false
                }
            
           }

           

       }
    func didBegin(_ contact: SKPhysicsContact) {

       if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.map)||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.map && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player)){
        
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
     
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player)){
            if(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet){
                contact.bodyA.node?.removeFromParent()
                reset = true
            }else {
                contact.bodyB.node?.removeFromParent()
                reset = true
            }
    
        }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.map && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.map)){
              if(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet){
       
                  contact.bodyA.node?.removeFromParent()
                  
              }else {
                
                  contact.bodyB.node?.removeFromParent()
                 
              }
              
      
          }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.mapEdge && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.mapEdge)){
              if(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.bullet){
            
                  contact.bodyA.node?.removeFromParent()
                  
              }else {
               
                  contact.bodyB.node?.removeFromParent()
                 
              }
              
      
          }
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.laser )||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.laser && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player)){
            if(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.laser){
             
                reset = true
            }else {
                
                reset = true
            }
    
        }
        
        if ((contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.door && hasKey==true)||(contact.bodyA.node?.physicsBody?.categoryBitMask==PhysicsCategory.door && contact.bodyB.node?.physicsBody?.categoryBitMask==PhysicsCategory.player && hasKey==true)){
            print("finishLevel")
            finishedLevel=true
            if ti < highScoreNumber3{
                highScoreNumber3 = ti
                defaults.set(highScoreNumber3, forKey: "highScoreSaved3")
            }
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
    
   

