//
//  credit.swift
//  Platformer
//
//  Created by 64004018 on 5/24/21.
//

import UIKit
import SpriteKit
import GameplayKit

class credit: SKScene {
    var one = SKLabelNode(text: "thanks viktor hahn and etqws3 for making the tiles")
    var menu = SKLabelNode(text: "menu")
    override func didMove(to view: SKView){
        one.fontSize = 30
        one.fontColor = SKColor.white
        one.zPosition = 1
        one.position = CGPoint(x: 0, y: 50)
        addChild(one)
        
        menu.position = CGPoint(x: -250, y: 130)
        menu.zPosition = 3
        menu.fontSize = 20
        menu.fontColor = SKColor.white
        menu.alpha = 0.8
        self.addChild(menu)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
             for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
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
             }
    }
}
