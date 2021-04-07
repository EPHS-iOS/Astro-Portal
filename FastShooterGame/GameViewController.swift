//
//  GameViewController.swift
//  FastShooterGame
//
//  Created by 64011731 on 2/22/21.
//

import UIKit
import SpriteKit
import GameplayKit

enum gameState {
    case preGame
    case inGame
    case afterGame
}
var currentGameState = gameState.preGame

class GameViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
        }

        
        if currentGameState == gameState.inGame {
            super.viewDidLoad()
            if let view = self.view as! SKView? {
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

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

