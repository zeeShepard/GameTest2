//
//  InstructionScene.swift
//  GameTest2
//
//  Created by Zack Shepard on 1/29/16.
//  Copyright © 2016 Zack Shepard. All rights reserved.
//

import UIKit
import SpriteKit

class InstructionScene: SKScene {
    
    
    
    // Private GameScene Properties
    
    var contentCreated = false
    var menuLabelBox: CGRect?
   // var blitzLabelBox: CGRect?
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    func createContent() {
        
       /* let instructLabel = SKLabelNode(fontNamed: "Chalkduster")
        instructLabel.fontSize = 50
        instructLabel.fontColor = SKColor.whiteColor()
        instructLabel.text = "Instructions"
        instructLabel.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        
        self.addChild(instructLabel)*/
        
        let shape = SKShapeNode(circleOfRadius: 30.0)
        shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.size.width/2)
        shape.physicsBody?.friction = 0.3
        shape.physicsBody?.restitution = 0.8
        shape.physicsBody?.mass = 0.1
        shape.physicsBody?.allowsRotation = true
        shape.fillColor = SKColor.greenColor()
        shape.physicsBody?.affectedByGravity = false
        shape.position = CGPoint(x: frame.width/2, y: frame.height-50)
        shape.name = "shape"
        
        self.addChild(shape)
        
        
        let menuLabel = SKLabelNode(fontNamed: "Chalkduster")
        menuLabel.fontSize = 25
        menuLabel.fontColor = SKColor.whiteColor()
        menuLabel.text = "Back to Menu"
        menuLabel.position = CGPointMake(self.size.width/2, self.size.height/2)//instructLabel.frame.origin.y - instructLabel.frame.size.height - 40);
        
        self.addChild(menuLabel)
        let menuLabelOrigin = CGPointMake(menuLabel.position.x - menuLabel.frame.width/2, menuLabel.position.y - menuLabel.frame.height/2)
        let menuLabelSize = CGSize(width: menuLabel.frame.width , height: menuLabel.frame.height)
        
        menuLabelBox = CGRectMake(menuLabelOrigin.x, menuLabelOrigin.y, menuLabelSize.width, menuLabelSize.height)
        /*
        let blitzLabel = SKLabelNode(fontNamed: "Chalkduster")
        blitzLabel.fontSize = 25
        blitzLabel.fontColor = SKColor.whiteColor()
        blitzLabel.text = "Blitz Mode"
        blitzLabel.position = CGPointMake(self.size.width/2, tapLabel.frame.origin.y - tapLabel.frame.height - 40);
        
        self.addChild(blitzLabel)
        
        let blitzLabelOrigin = CGPointMake(blitzLabel.position.x - blitzLabel.frame.width/2, blitzLabel.position.y - blitzLabel.frame.height/2)
        let blitzLabelSize = CGSize(width: blitzLabel.frame.width , height: blitzLabel.frame.height)
        
        blitzLabelBox = CGRectMake(blitzLabelOrigin.x, blitzLabelOrigin.y, blitzLabelSize.width, blitzLabelSize.height)
        
        let instructLabel = SKLabelNode(fontNamed: "Chalkduster")
        instructLabel.fontSize = 25
        instructLabel.fontColor = SKColor.whiteColor()
        instructLabel.text = "Instructions(coming soon)"
        instructLabel.position = CGPointMake(self.size.width/2, blitzLabel.frame.origin.y - blitzLabel.frame.height - 40);
        
        self.addChild(instructLabel)
        
        let optionLabel = SKLabelNode(fontNamed: "Chalkduster")
        optionLabel.fontSize = 25
        optionLabel.fontColor = SKColor.whiteColor()
        optionLabel.text = "Options(coming soon)"
        optionLabel.position = CGPointMake(self.size.width/2, instructLabel.frame.origin.y - instructLabel.frame.height - 40);
        
        self.addChild(optionLabel)
        
        // black space color*/
        self.backgroundColor = SKColor.blackColor()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            let touchLocation = touch.locationInNode(self)

                if let body = physicsWorld.bodyAtPoint(touchLocation){
                    if body.node?.name == "shape" {
                        body.node?.removeFromParent()
                    }
            }
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
        for touch in touches{
            let touchLocation = touch.locationInNode(self)
            //print(tapLabelBox)
            //print(touchLocation)
            
            if  menuLabelBox!.contains(touchLocation) {
                let startScene = StartScene(size: self.size)
                startScene.scaleMode = .AspectFill
                
                self.view?.presentScene(startScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }
            
           /* if blitzLabelBox!.contains(touchLocation) {
                let blitzScene = BlitzScene(size: self.size)
                blitzScene.scaleMode = .AspectFill
                self.view?.presentScene(blitzScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }*/
        }
    }
}