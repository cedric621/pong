//
//  GameScene.swift
//  Pong
//
//  Created by P.M. Student on 4/12/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    var paddles:SKSpriteNode!
    var scoreLabel:SKLabelNode!
    var scoresLabel:SKLabelNode!
    var scores = 0 {
    didSet {
    scoresLabel.text = "Scores:\(scores)"
}
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "Score:\(score)"
        }
        
    }
    
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as? SKSpriteNode
        paddle = self.childNode(withName: "paddle") as? SKSpriteNode
        paddles = self.childNode(withName: "paddles") as? SKSpriteNode
        scoreLabel = self.childNode(withName: "Score") as? SKLabelNode
        scoresLabel = self.childNode(withName: "Scores") as? SKLabelNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 30,dy: 30))
        paddles.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 500))
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        self.physicsWorld.contactDelegate = self
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            // paddle.position.x = touchLocation.x
             paddle.position.y = touchLocation.y
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
           // paddle.position.x = touchLocation.x
            paddle.position.y = touchLocation.y
        }
        
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        if (score == 15) {
            scoreLabel.text = "You are Losers!"
            self.view?.isPaused = true
            
            }
        if (scores == 10) {
                scoresLabel.text = "You are Winner!"
                self.view?.isPaused = true
                
                }
        if (ball.position.x < paddle.position.x ) {
            score += 1
        }
        if (ball.position.x > paddles.position.x ) {
            scores += 1
        }
    }

    }
    
    
    
