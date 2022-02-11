//
//  lb.swift
//  Platformer
//
//  Created by 64004018 on 2/10/22.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class lb: SKScene {
    let defaults = UserDefaults()
    lazy var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
    lazy var highScoreNumber1 = defaults.integer(forKey: "highScoreSaved1")
    lazy var highScoreNumber2 = defaults.integer(forKey: "highScoreSaved2")
    lazy var highScoreNumber3 = defaults.integer(forKey: "highScoreSaved3")
    lazy var highScoreNumber4 = defaults.integer(forKey: "highScoreSaved4")
    lazy var highScoreNumber5 = defaults.integer(forKey: "highScoreSaved5")
    lazy var highScoreNumber6 = defaults.integer(forKey: "highScoreSaved6")
    lazy var highScoreNumber7 = defaults.integer(forKey: "highScoreSaved7")
    lazy var highScoreNumber8 = defaults.integer(forKey: "highScoreSaved8")
    lazy var highScoreNumber9 = defaults.integer(forKey: "highScoreSaved9")
    var menu = SKLabelNode(text: "menu")
    
    override func didMove(to view: SKView){
        if highScoreNumber == 0 {
        var one = SKLabelNode(text: "Level 1: N/A")
        one.fontSize = scene!.size.width/22
        one.fontColor = SKColor.white
        one.zPosition = 1
            one.position = CGPoint(x:  -scene!.size.width/2.2, y: scene!.size.height/4)
        one.horizontalAlignmentMode = .left
        addChild(one)
        } else {
            var one = SKLabelNode(text: "Level 1: \(highScoreNumber)")
            one.fontSize = scene!.size.width/22
            one.fontColor = SKColor.white
            one.zPosition = 1
            one.position = CGPoint(x:  -scene!.size.width/2.2, y: scene!.size.height/4)
            one.horizontalAlignmentMode = .left
            addChild(one)
        }
        if highScoreNumber1 == 0 {
        var two = SKLabelNode(text: "Level 2: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: scene!.size.height/8)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 2: \(highScoreNumber1)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: scene!.size.height/8)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber2 == 0 {
        var two = SKLabelNode(text: "Level 3: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/2.2, y: -scene!.size.height/10000)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 3: \(highScoreNumber2)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: -scene!.size.height/10000)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber3 == 0 {
        var two = SKLabelNode(text: "Level 4: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: -scene!.size.height/8)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 4: \(highScoreNumber3)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: -scene!.size.height/8)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber4 == 0 {
        var two = SKLabelNode(text: "Level 5: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: -scene!.size.height/4)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 5: \(highScoreNumber4)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  -scene!.size.width/2.2, y: -scene!.size.height/4)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber5 == 0 {
        var one = SKLabelNode(text: "Level 6: N/A")
        one.fontSize = scene!.size.width/22
        one.fontColor = SKColor.white
        one.zPosition = 1
            one.position = CGPoint(x:  scene!.size.width/4.5, y: scene!.size.height/4)
        one.horizontalAlignmentMode = .left
        addChild(one)
        } else {
            var one = SKLabelNode(text: "Level 6: \(highScoreNumber5)")
            one.fontSize = scene!.size.width/22
            one.fontColor = SKColor.white
            one.zPosition = 1
            one.position = CGPoint(x:  scene!.size.width/4.5, y: scene!.size.height/4)
            one.horizontalAlignmentMode = .left
            addChild(one)
        }
        if highScoreNumber6 == 0 {
        var two = SKLabelNode(text: "Level 7: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: scene!.size.height/8)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 7: \(highScoreNumber6)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: scene!.size.height/8)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber7 == 0 {
        var two = SKLabelNode(text: "Level 8: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/10000)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 8: \(highScoreNumber7)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/10000)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber8 == 0 {
        var two = SKLabelNode(text: "Level 9: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/8)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 9: \(highScoreNumber8)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/8)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if highScoreNumber9 == 0 {
        var two = SKLabelNode(text: "Level 10: N/A")
        two.fontSize = scene!.size.width/22
        two.fontColor = SKColor.white
        two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/4)
        two.horizontalAlignmentMode = .left
        addChild(two)
        } else {
            var two = SKLabelNode(text: "Level 10: \(highScoreNumber9)")
            two.fontSize = scene!.size.width/22
            two.fontColor = SKColor.white
            two.zPosition = 1
            two.position = CGPoint(x:  scene!.size.width/4.5, y: -scene!.size.height/4)
            two.horizontalAlignmentMode = .left
            addChild(two)
        }
        if (highScoreNumber9 == 0 || highScoreNumber8 == 0 || highScoreNumber7 == 0 || highScoreNumber6 == 0 || highScoreNumber5 == 0 || highScoreNumber4 == 0 || highScoreNumber3 == 0 || highScoreNumber2 == 0 || highScoreNumber1 == 0 || highScoreNumber == 0) {
            var com = SKLabelNode(text: "Combined")
            com.fontSize = scene!.size.width/22
            com.fontColor = SKColor.white
            com.zPosition = 1
            com.position = CGPoint(x:  -scene!.size.width/10, y: scene!.size.height/4)
            com.horizontalAlignmentMode = .left
            addChild(com)
            var ti = SKLabelNode(text: "N/A")
            ti.fontSize = scene!.size.width/22
            ti.fontColor = SKColor.white
            ti.zPosition = 1
            ti.position = CGPoint(x:  -scene!.size.width/10, y: scene!.size.height/7)
            ti.horizontalAlignmentMode = .left
            addChild(ti)
        } else {
            var com = SKLabelNode(text: "Combined")
            com.fontSize = scene!.size.width/22
            com.fontColor = SKColor.white
            com.zPosition = 1
            com.position = CGPoint(x:  -scene!.size.width/10, y: scene!.size.height/4)
            com.horizontalAlignmentMode = .left
            addChild(com)
            var ti = SKLabelNode(text: "\(highScoreNumber9+highScoreNumber8+highScoreNumber7+highScoreNumber6+highScoreNumber5+highScoreNumber4+highScoreNumber3+highScoreNumber2+highScoreNumber1+highScoreNumber)")
            ti.fontSize = scene!.size.width/22
            ti.fontColor = SKColor.white
            ti.zPosition = 1
            ti.position = CGPoint(x:  -scene!.size.width/10, y: scene!.size.height/7)
            ti.horizontalAlignmentMode = .left
            addChild(ti)
        }
       
        
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
