//
//  level.swift
//  Platformer
//
//  Created by 64011731 on 4/7/21.
//

import UIKit
import SpriteKit
import GameplayKit
class level: SKScene {
    var startLabel = SKLabelNode(text: "Level Select")
    var l1 = SKLabelNode(text: "1")
    var l2 = SKLabelNode(text: "2")
    var l3 = SKLabelNode(text: "3")
    var l4 = SKLabelNode(text: "4")
    var l5 = SKLabelNode(text: "5")
    var l6 = SKLabelNode(text: "6")
    var l7 = SKLabelNode(text: "7")
    var l8 = SKLabelNode(text: "8")
    var l9 = SKLabelNode(text: "9")
    var l10 = SKLabelNode(text: "10")
    var credit = SKLabelNode(text: "Credits")
    var lb = SKLabelNode(text: "Leaderboard")
    var sp = SKLabelNode(text: "Shop")
    
        override func didMove(to view: SKView){
            startLabel.fontSize = 50
            startLabel.fontColor = SKColor.white
            startLabel.zPosition = 1
            startLabel.position = CGPoint(x: 0, y: 120)
            addChild(startLabel)
            
            l1.fontSize = 35
            l1.fontColor = SKColor.white
            l1.position = CGPoint(x: -250, y: 60)
            addChild(l1)
            
            l2.fontSize = 35
            l2.fontColor = SKColor.white
            l2.position = CGPoint(x: -150, y: 60)
            addChild(l2)
            
            l3.fontSize = 35
            l3.fontColor = SKColor.white
            l3.position = CGPoint(x: -50, y: 60)
            addChild(l3)
            
            l4.fontSize = 35
            l4.fontColor = SKColor.white
            l4.position = CGPoint(x: 50, y: 60)
            addChild(l4)
            
            l5.fontSize = 35
            l5.fontColor = SKColor.white
            l5.position = CGPoint(x: 150, y: 60)
            addChild(l5)
            
            l6.fontSize = 35
            l6.fontColor = SKColor.white
            l6.position = CGPoint(x: 250, y: 60)
            addChild(l6)
            
            l7.fontSize = 35
            l7.fontColor = SKColor.white
            l7.position = CGPoint(x: -200, y: 0)
            addChild(l7)
            
            l8.fontSize = 35
            l8.fontColor = SKColor.white
            l8.position = CGPoint(x: -100, y: 0)
            addChild(l8)
            
            l9.fontSize = 35
            l9.fontColor = SKColor.white
            l9.position = CGPoint(x: 1, y: 0)
            addChild(l9)
            
            l10.fontSize = 35
            l10.fontColor = SKColor.white
            l10.position = CGPoint(x: 100, y: 0)
            addChild(l10)
            
            lb.fontSize = 35
            lb.fontColor = SKColor.white
            lb.position = CGPoint(x: 1, y: -150)
            addChild(lb)

            sp.fontSize = 35
            sp.fontColor = SKColor.white
            sp.position = CGPoint(x: 250, y: -150)
            addChild(sp)

            
            credit.fontSize = 35
            credit.fontColor = SKColor.white
            credit.position = CGPoint(x: -250, y: -150)
            addChild(credit)
            
            print(self.size.height)
            print(self.size.width)
            
        
  
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            
            if l1.contains(pointOfTouch){
                lev = 1
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "GameScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l2.contains(pointOfTouch){
                lev = 2
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level2") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l3.contains(pointOfTouch){
                lev = 3
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level3") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l4.contains(pointOfTouch){
                lev = 4
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level4") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l5.contains(pointOfTouch){
                lev = 5
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level5") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l6.contains(pointOfTouch){
                lev = 6
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level6") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l7.contains(pointOfTouch){
                lev = 7
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level7") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l8.contains(pointOfTouch){
                lev = 8
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level8") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l9.contains(pointOfTouch){
                lev = 9
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level9") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if l10.contains(pointOfTouch){
                lev = 10
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "level10") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if credit.contains(pointOfTouch){
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "credit") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if lb.contains(pointOfTouch){
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "lb") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
            if sp.contains(pointOfTouch){
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "credit") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFit
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.showsPhysics = false
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true //hi
                }
            }
        }
    }
}
