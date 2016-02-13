//
//  BlitzScene.swift
//  GameTest2
//
//  Created by Zack Shepard on 1/28/16.
//  Copyright © 2016 Zack Shepard. All rights reserved.
//

import SpriteKit
import AVFoundation


class BlitzScene: SKScene, SKPhysicsContactDelegate {
    
    
    var nodeNumber = 0
    var splitLocation: CGPoint?
    var velocityMultiplier = 1
    var scoreThing = 0
    //var scoreMultiplier = 0
    var numberOfTaps = 0.0
    var numberOfHits = 0.0
    
    
    
    
    
    override func didMoveToView(view: SKView) {
        self.scene?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.physicsWorld.gravity = CGVectorMake(0, -3)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        self.physicsBody = physicsBody
        //physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
        self.physicsBody!.categoryBitMask = sceneEdge
        self.physicsWorld.contactDelegate = self
        sceneScene = "BlitzScene"
        
        
        /*for i in 1...30{
        let shape = SKShapeNode(circleOfRadius: 20)
        //shape = childNodeWithName(ShapeCategoryName) as! SKSpriteNode!
        
        shape.strokeColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        shape.lineWidth = 4
        //let text = SKLabelNode(text: String(i))
        text.fontSize = 9.0
        shape.addChild(text)
        shape.position = CGPoint (x: CGFloat(arc4random()%(canvasWidth)), y: CGFloat(arc4random()%(canvasHeight)))
        self.addChild(shape)
        shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.size.width/2)
        shape.physicsBody?.friction = 0.3
        shape.physicsBody?.restitution = 0.8
        shape.physicsBody?.mass = 0.1
        shape.physicsBody?.allowsRotation = true
        shape.name = ShapeCategoryName
        */
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addShape),
                SKAction.waitForDuration(0.5)
                ])
            
            ))
        
        setupHud()
        
        // }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            ++numberOfTaps
            let touchLocation = touch.locationInNode(self)
            if physicsWorld.bodyAtPoint(touchLocation) != nil{
                ++numberOfHits
                accuracyRating = (numberOfHits/numberOfTaps) * 100
            if let body = physicsWorld.bodyAtPoint(touchLocation) {
                
                runAction(SKAction.playSoundFileNamed("Pop.caf", waitForCompletion: false))
                
                print("size:", body.node?.frame.width, body.node?.name)
                print("xscale", body.node?.xScale)
                if (body.node?.name == ShapeCategoryName || body.node?.name == "red" || body.node?.name == "blue") && body.node?.xScale < 1.2{
                    
                    if body.node?.name == "red"{
                        runAction(SKAction.runBlock(redSplit))
                        print("red")
                    }
                    print(body.node?.physicsBody?.mass)
                    scoreThing = 10 * (scoreMultiplier/5 + 1)
                    //if body.node!.physicsBody?.mass < 0.2{
                    // body.node!.physicsBody?.mass -= 0.1
                    
                    
                    //body.applyImpulse(CGVectorMake(CGFloat (10), CGFloat(200)))
                    print("worked")
                    // self.adjustScoreBy(10)
                    // --nodeNumber
                    //print(body.node!.name)
                    //SKAction.runBlock(scorePopups)
                    if body.node?.name == "blue" {
                        self.adjustScoreBy(-10)
                        let scorePopup = SKLabelNode(fontNamed: "Chalkduster")
                        scorePopup.fontSize = 20
                        scorePopup.fontColor = SKColor.whiteColor()
                        scorePopup.text = "-10"
                        scorePopup.position = touchLocation
                        self.addChild(scorePopup)
                        let action = SKAction.fadeOutWithDuration(1.5)
                        let moveAction = SKAction.moveTo(scoreLocation!, duration: 2)
                        
                        scorePopup.runAction(action)
                        scorePopup.runAction(moveAction)
                        print("blue, ", body.node?.name)
                        scoreMultiplier = 0
                    }else if body.node?.name != "blue"{
                        --nodeNumber
                        ++scoreMultiplier
                        if scoreMultiplier > topStreak {
                            topStreak = scoreMultiplier
                        }
                        self.adjustScoreBy(10)
                        let scorePopup = SKLabelNode(fontNamed: "Chalkduster")
                        scorePopup.fontSize = 20
                        scorePopup.fontColor = SKColor.whiteColor()
                        scorePopup.text = String(format: "+ %u", scoreThing)
                        scorePopup.position = touchLocation //CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
                        
                        self.addChild(scorePopup)
                        
                        let action = SKAction.fadeOutWithDuration(1.5)
                        let moveAction = SKAction.moveTo(scoreLocation!, duration: 2)
                        
                        scorePopup.runAction(action)
                        scorePopup.runAction(moveAction)
                        print("Not blue, ", body.node?.name)
                        
                    }
                    
                    body.node!.removeFromParent()
                    
                    splitLocation = touchLocation
                    //}
                    // body.node!.physicsBody?.mass -= 0.1
                    
                    
                    
                }else{
                    body.node?.setScale(0.8)//runAction(SKAction.scaleTo(0.7, duration: 0.5))
                }
                /* if body.node!.name == "white"{
                // body.
                }*/
            }
            }else{
                scoreMultiplier = 0
            }
            /* let shape = SKShapeNode(circleOfRadius: 20)
            shape.strokeColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
            shape.lineWidth = 4
            //let text = SKLabelNode(text: String(i))
            // text.fontSize = 9.0
            //shape.addChild(text)
            // let location = touch.locationInNode(self)
            shape.position = touch.locationInNode(self)
            self.addChild(shape)
            shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.size.width/2)
            shape.physicsBody?.friction = 0.3
            shape.physicsBody?.restitution = 0.8
            shape.physicsBody?.mass = 0.1
            shape.physicsBody?.allowsRotation = true
            shape.physicsBody?.categoryBitMask = BallCategory
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat((50) ), 180))*/
        }
        //shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat((5) % 30), -10))
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        // 1. Create local variables for two physics bodies
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        print("physicsBody")
        
        // 2. Assign the two physics bodies so that the one with the lower category is always stored in firstBody
        if contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 3. react to the contact between ball and bottom
        if (firstBody.categoryBitMask & PhysicsCategory.Shape != 0) && (secondBody.categoryBitMask & PhysicsCategory.Shape != 0) {
            secondBody.node!.removeFromParent()//strokeColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.5)
            print("bottom")
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        gameOver()
        //didBeginContact()
    }
    
    func addShape() {
        //let random = Int(arc4random_uniform(width))
        let shape = SKShapeNode(circleOfRadius: 30.0)
        //shape = childNodeWithName(ShapeCategoryName) as! SKSpriteNode!
        let rand = arc4random_uniform(6)
        let ran = arc4random_uniform(2)
        
        
        
        //shape.strokeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        //shape.fillColor = UIColor(red: 0,  green: 255, blue: 0, alpha: 0.5)
        shape.lineWidth = 0
        // let randWidth:CGFloat = arc4random_uniform(UInt32(width))
        
        // let actualY = random(min: shape.size.height/2, max: size.height - shape.size.height/2)
        //let text = SKLabelNode(text: String(i))
        //text.fontSize = 9.0
        //shape.addChild(text)
        //shape.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32( frame.size.width))), y: frame.size.height)
        //shape.position = CGPoint(x: frame.width/2, y: frame.height/2)
        let random = Int(arc4random_uniform(100))-50
        let velocity = Int(arc4random_uniform(20))-50
        //let angle = (random - 150)
        self.addChild(shape)
        shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.size.width/2)
        shape.physicsBody?.friction = 0.3
        shape.physicsBody?.restitution = 0.8
        shape.physicsBody?.mass = 0.1
        shape.physicsBody?.allowsRotation = true
        shape.physicsBody?.categoryBitMask = PhysicsCategory.Shape
        shape.physicsBody?.collisionBitMask = PhysicsCategory.All
        shape.name = ShapeCategoryName
        //shape.physicsBody!.collisionBitMask = sceneEdge
        //shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat( random), CGFloat(velocity)))
        //shape.valueForKey("white")
        //shape.physicsBody?.app
        switch(rand) {
        case 1:
            shape.fillColor = SKColor.greenColor()
            //shape.physicsBody!.collisionBitMask = sceneEdge
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat(random), CGFloat(velocity * (velocityMultiplier + 1))))
        case 2:
            shape.fillColor = SKColor.blueColor()
            shape.name = "blue"
            //shape.physicsBody?.collisionBitMask = sceneEdge
            shape.physicsBody?.collisionBitMask = PhysicsCategory.None
            shape.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32( frame.size.width))), y: frame.size.height - 50)
            --nodeNumber
            
        case 3:
            shape.fillColor = SKColor.yellowColor()
            //shape.physicsBody!.collisionBitMask = sceneEdge
            shape.physicsBody?.affectedByGravity = false
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat(random), CGFloat(velocity * (velocityMultiplier + 1))))
        case 4:
            shape.fillColor = SKColor.redColor()
            //shape.physicsBody!.collisionBitMask = sceneEdge
            shape.name = "red"
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat(random), CGFloat(velocity * (velocityMultiplier + 1))))
        case 5:
            shape.fillColor = SKColor.purpleColor()
            //shape.physicsBody!.collisionBitMask = sceneEdge
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat(random), CGFloat(velocity * (velocityMultiplier + 1))))
        default:
            shape.fillColor = SKColor.whiteColor()
            //shape.physicsBody!.collisionBitMask = sceneEdge
            shape.physicsBody?.mass = 0.2
            shape.setScale(1.4)
            shape.physicsBody!.applyImpulse(CGVectorMake(CGFloat(random), CGFloat(velocity * (velocityMultiplier + 1))))
        }
        
        switch(ran) {
        case 1:
            shape.position = CGPoint(x: frame.origin.x , y: CGFloat(arc4random_uniform(UInt32( frame.size.height))))
        case 2:
            shape.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32( frame.size.width))), y: frame.origin.y)
        case 3:
            shape.position = CGPoint(x: frame.size.width, y: CGFloat(arc4random_uniform(UInt32( frame.size.height))))
        default:
            shape.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32( frame.size.width))), y: frame.size.height)
        }
        
        ++nodeNumber
        
        print(random)
    }
    
    func setupHud() {
        
        let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.name = scoreText
        scoreLabel.fontSize = 25
        
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.text = String(format: "Score: %04u", 0)
        
        //print(size.height)
        scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (40 + scoreLabel.frame.size.height/2 ))
        addChild(scoreLabel)
        
        scoreLocation = scoreLabel.position
        
        let streakLabel = SKLabelNode(fontNamed: "Chalkduster")
        streakLabel.name = streakText
        streakLabel.fontSize = 15
        streakLabel.fontColor = SKColor.greenColor()
        streakLabel.text = String(format: "Streak Multiplier: %02u", 0)
        streakLabel.position = CGPoint(x: frame.origin.x + 100, y: frame.origin.y + 50)
        
        addChild(streakLabel)
        
        //var nodeText = nodeNumber
        
        /*let nodeLabel = SKLabelNode(fontNamed: "Chalkduster")
        //nodeLabel.name = nodeText
        nodeLabel.fontSize = 12
        nodeLabel.fontColor = SKColor.whiteColor()
        nodeLabel.text = String(format: "", arguments: <#T##[CVarArgType]#>)
        
        */
    }
    
    func adjustScoreBy(points: Int) {
        
        scorePoints += points
        
        let score = self.childNodeWithName(scoreText) as! SKLabelNode
        
        score.text = String(format: "Score: %04u", scorePoints)
        velocityMultiplier = scorePoints/500
        print("score multiplier, ", velocityMultiplier)
        print("score", scorePoints)
        
        let streak = self.childNodeWithName(streakText) as! SKLabelNode
        
        streak.text = String(format: "Streak Multiplier: %02u", scoreMultiplier)
        
    }
    
    func scorePopups() {
        let scorePopup = SKLabelNode(fontNamed: "Chalkduster")
        scorePopup.fontSize = 50
        scorePopup.fontColor = SKColor.whiteColor()
        scorePopup.text = "Point"
        scorePopup.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        
        self.addChild(scorePopup)
    }
    
    func redSplit() {
        let redOne  = SKShapeNode(circleOfRadius: 20)
        redOne.fillColor = SKColor.redColor()
        self.addChild(redOne)
        redOne.physicsBody = SKPhysicsBody(circleOfRadius: redOne.frame.size.width/2)
        redOne.physicsBody?.friction = 0.3
        redOne.physicsBody?.restitution = 0.8
        redOne.physicsBody?.mass = 0.1
        redOne.physicsBody?.allowsRotation = true
        //redOne.name = RedOneCategoryName
        redOne.name = ShapeCategoryName
        redOne.physicsBody!.collisionBitMask = sceneEdge
        redOne.position = splitLocation!
        redOne.physicsBody?.applyImpulse(CGVectorMake(10, 5))
        
        let redTwo = SKShapeNode(circleOfRadius: 20)
        redTwo.fillColor = SKColor.redColor()
        self.addChild(redTwo)
        redTwo.physicsBody = SKPhysicsBody(circleOfRadius: redTwo.frame.size.width/2)
        redTwo.physicsBody?.friction = 0.3
        redTwo.physicsBody?.restitution = 0.8
        redTwo.physicsBody?.mass = 0.1
        redTwo.physicsBody?.allowsRotation = true
        //redTwo.name = RedTwoCategoryNode
        redTwo.name = ShapeCategoryName
        redTwo.physicsBody!.collisionBitMask = sceneEdge
        redTwo.position = splitLocation!
        redOne.physicsBody?.applyImpulse(CGVectorMake(10, 5))
        print("red split")
        
        nodeNumber += 2
        runAction(SKAction.playSoundFileNamed("Pop.caf", waitForCompletion: false))
    }
    
    func gameOver() {
        if nodeNumber == 5 {
            let gameOverScene: GameOverScene = GameOverScene(size: self.size)
            
            view!.presentScene(gameOverScene, transition: SKTransition.doorsOpenHorizontalWithDuration(1.0))
        }
    }
    
}