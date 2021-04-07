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
    var startLabel = SKLabelNode(text: "hi")
        override func didMove(to view: SKView){
            print("hi")
            startLabel.fontSize = 100
            startLabel.fontColor = SKColor.red
            startLabel.zPosition = 1
            startLabel.position = CGPoint(x: 0, y: 0)
            
            addChild(startLabel)
        
  
        }
}
