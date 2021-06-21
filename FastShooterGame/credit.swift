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
    var one = SKLabelNode(text: "Thanks viktor hahn and etqws3 for making the tiles")
    var menu = SKLabelNode(text: "menu")
    var two = SKLabelNode(text: "Thanks jahndan_ for the background music")
    override func didMove(to view: SKView){
        one.fontSize = scene!.size.width/22
        one.fontColor = SKColor.white
        one.zPosition = 1
        one.position = CGPoint(x:  0, y: scene!.size.height/5)
        addChild(one)
       two.fontSize = scene!.size.width/22
      two.fontColor = SKColor.white
        two.zPosition = 1
       two.position = CGPoint(x:  0, y: scene!.size.height/11)
        addChild(two)
        
        menu.position = CGPoint(x: -scene!.size.width/3, y:  scene!.size.height/3)
        menu.zPosition = 3
        menu.fontSize =  scene!.size.width/20
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
