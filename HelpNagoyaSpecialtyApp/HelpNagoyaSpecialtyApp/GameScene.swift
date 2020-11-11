//
//  GameScene.swift
//  HelpNagoyaSpecialtyApp
//
//  Created by 尾原徳泰 on 2020/11/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import SpriteKit


class GameScene: SKScene {
    
    func makeSquare() {
        let square = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 50))
        
        square.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        
        let squareSize = CGSize(width: self.size.width * 0.1, height: self.size.width * 0.1)
        
        square.physicsBody = SKPhysicsBody(rectangleOf: squareSize)
        
        self.addChild(square)
    }
    
    
    override func didMove(to view: SKView) {
        // 落下処理実装
        self.physicsWorld.gravity = CGVector.init(dx: 0.0, dy: -1.0)
//        self.physicsWorld.speed = CGFloat(1.0)
         // 背景追加
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.size = self.size
//        background.zPosition = -1
//        self.addChild(background)
        
        makeSquare()

//        self.fallNagoyaSpecialty()
    }
    
    // 名古屋名物の落下処理
    func fallNagoyaSpecialty() {
        let texture = SKTexture(imageNamed: "1")
        let sprite = SKSpriteNode(texture: texture)
        
        sprite.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        sprite.size = CGSize(width: texture.size().width * 0.001, height: texture.size().height * 0.001)
        
        // テクスチャからphysicsBodyを追加
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        
        self.addChild(sprite)
    }
}
