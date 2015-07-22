//
//  GameScene.swift
//  FrostByte
//
//  Created by Kyle Brooks Robinson on 6/24/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var snowman: SKSpriteNode!
    
    var counter: CGFloat = 10
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        snowman = childNodeWithName("Billy") as! SKSpriteNode
        
        buildLayout(stageLayout)
        
        let atlas = SKTextureAtlas(named: "snowman")
        
        var textures: [SKTexture] = []
        
        for i in 0..<atlas.textureNames.count {
            
            let texture = SKTexture(imageNamed: "snowman\(i)")
            
            textures.append(texture)
            
        }
        
        let action = SKAction.animateWithTextures(textures, timePerFrame: 0.1)
        
        let forever = SKAction.repeatActionForever(action)

        snowman.runAction(forever)
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        counter = 10
        
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        var snowballSize = CGFloat(counter * 1.5)
        
        
        
        let snowmanHead = SKShapeNode(ellipseOfSize: CGSizeMake(snowballSize, snowballSize))

        
        snowmanHead.fillColor = UIColor.whiteColor()
        
        snowmanHead.physicsBody = SKPhysicsBody(circleOfRadius: (snowballSize / 2))
        
//        snowmanHead.physicsBody?.mass = (snowballSize * 2)
        
        snowmanHead.position = snowman.position
        
        snowmanHead.position = CGPointMake(200,100)
        
        addChild(snowmanHead)
        
        snowmanHead.physicsBody?.applyImpulse(CGVectorMake(300, 100))
    }
   
    func buildLayout(layout: [Block]) {
        
        let gridSize: CGFloat = 20
        let gridMetric = (frame.width / 2) / gridSize
        
        for block in layout {
            
            let size = CGSizeMake(block.wide * gridMetric, block.tall * gridMetric)
            
            let blockNode = SKShapeNode(rectOfSize: size, cornerRadius: 4)
            
            let x = (block.left * gridMetric) + (size.width / 2) + (frame.width / 2)
            let y = (block.bottom * gridMetric) + (size.height / 2) + 20
            
            blockNode.position = CGPointMake(x, y)
            
            blockNode.fillColor = UIColor.whiteColor()
            blockNode.strokeColor = UIColor.clearColor()
            
            blockNode.physicsBody = SKPhysicsBody(rectangleOfSize: size)
            
            addChild(blockNode)
            
        }
        
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        
        
        if counter < 100 {
            
            counter++
            
        }
        
        
    
    }
}

struct Block {
    
    var left: CGFloat!
    var bottom: CGFloat!
    var wide: CGFloat!
    var tall: CGFloat!
    
    init(left l: CGFloat, bottom b: CGFloat, wide w: CGFloat, tall t: CGFloat) {
        
        left = l
        bottom = b
        wide = w
        tall = t
        
    }
    
}

let stageLayout: [Block] = [

    Block(left: 5, bottom: 0, wide: 1, tall: 3),
    Block(left: 7, bottom: 0, wide: 1, tall: 3),
    Block(left: 10, bottom: 0, wide: 1, tall: 3),
    Block(left: 12, bottom: 0, wide: 1, tall: 3),

    
    Block(left: 5, bottom: 3, wide: 3, tall: 1),
    Block(left: 10, bottom: 3, wide: 3, tall: 1),

    Block(left: 6, bottom: 4, wide: 1, tall: 3),
    Block(left: 11, bottom: 4, wide: 1, tall: 3),

    Block(left: 6, bottom: 7, wide: 6, tall: 1),
    
    Block(left: 8, bottom: 8, wide: 2, tall: 3),
    
    Block(left: 5, bottom: 11, wide: 8, tall: 1),
    
    Block(left: 5, bottom: 12, wide: 1, tall: 3),
    Block(left: 12, bottom: 12, wide: 1, tall: 3)





]




