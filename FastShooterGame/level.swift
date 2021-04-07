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
    var startLabel = SKLabelNode(text: "level 1")
        override func didMove(to view: SKView){
            startLabel.fontSize = 100
            startLabel.fontColor = SKColor.red
            startLabel.zPosition = 1
            startLabel.position = CGPoint(x: 0, y: 0)
            
            addChild(startLabel)
        
  
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            
            if startLabel.contains(pointOfTouch){
                lev = 1
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "GameScene") {
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
        }
    }
}
