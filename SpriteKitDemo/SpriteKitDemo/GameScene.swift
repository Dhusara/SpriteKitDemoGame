//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Serhii Demianenko on 08.03.2020.
//  Copyright © 2020 Serhii Demianenko. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = .zero
        let sprite = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        self.addChild(sprite)
        
        let spaceship = SKSpriteNode(imageNamed: "Spaceship")
        spaceship.setScale(0.3)
        spaceship.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(spaceship)
        
        let movePoint = CGPoint(x: self.size.width, y: self.size.height)
        let moveSpaceshipAction = SKAction.move(to: movePoint, duration: 3)
//        spaceship.run(moveSpaceshipAction)
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        let fadeOutFadeInSequence = SKAction.sequence([fadeOutAction, fadeInAction])
        let fadeOutFadeInSequenceFiveTimes = SKAction.repeat(fadeOutFadeInSequence, count: 5)
        
//        spaceship.run(fadeOutFadeInSequenceFiveTimes)
        
        let groupMoveAndFadeActions = SKAction.group([moveSpaceshipAction, fadeOutFadeInSequenceFiveTimes])
        spaceship.run(groupMoveAndFadeActions)
        
    }
        
}
