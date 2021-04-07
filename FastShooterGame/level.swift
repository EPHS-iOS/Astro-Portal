
import SpriteKit
import GameplayKit

class level: SKScene {
    var startLabel = SKLabelNode(text: "hi")
    override func didMove(to view: SKView){
        startLabel.fontSize = 100
        startLabel.fontColor = SKColor.red
        startLabel.zPosition = 1
        startLabel.position = CGPoint(x: 0, y: 0)
        self.addChild(startLabel)
    }

}
