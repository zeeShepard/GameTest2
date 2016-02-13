//
//  StartScene.swift
//  GameTest2
//
//  Created by Zack Shepard on 1/24/16.
//  Copyright © 2016 Zack Shepard. All rights reserved.
//

import UIKit
import SpriteKit

class StartScene: SKScene {
    
    
    
    // Private GameScene Properties
    
    var contentCreated = false
    var tapLabelBox: CGRect?
    var blitzLabelBox: CGRect?
    var instructLabelBox: CGRect?
    var switchLink: Int?
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    func createContent() {
        
        let startLabel = SKLabelNode(fontNamed: "Chalkduster")
        startLabel.fontSize = 50
        startLabel.fontColor = SKColor.whiteColor()
        startLabel.text = "Menu"
        startLabel.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        
        self.addChild(startLabel)
        
        let tapLabel = SKLabelNode(fontNamed: "Chalkduster")
        tapLabel.fontSize = 25
        tapLabel.fontColor = SKColor.whiteColor()
        tapLabel.text = "Tap to Play"
        tapLabel.position = CGPointMake(self.size.width/2, startLabel.frame.origin.y - startLabel.frame.size.height - 40);
        
        self.addChild(tapLabel)
        let tapLabelOrigin = CGPointMake(tapLabel.position.x - tapLabel.frame.width/2, tapLabel.position.y - tapLabel.frame.height/2)
        //let tapLabelCorner = CGPointMake(tapLabel.position.x + 20, tapLabel.position.y + 20)
        let tapLabelSize = CGSize(width: tapLabel.frame.width , height: tapLabel.frame.height)
        
        tapLabelBox = CGRectMake(tapLabelOrigin.x, tapLabelOrigin.y, tapLabelSize.width, tapLabelSize.height)
        
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
        
        let instructLabelOrigin = CGPointMake(instructLabel.position.x - instructLabel.frame.width/2, instructLabel.position.y - instructLabel.frame.height/2)
        let instructLabelSize = CGSize(width: instructLabel.frame.width , height: instructLabel.frame.height)
        
        instructLabelBox = CGRectMake(instructLabelOrigin.x, instructLabelOrigin.y, instructLabelSize.width, instructLabelSize.height)
        
        let optionLabel = SKLabelNode(fontNamed: "Chalkduster")
        optionLabel.fontSize = 25
        optionLabel.fontColor = SKColor.whiteColor()
        optionLabel.text = "Options(coming soon)"
        optionLabel.position = CGPointMake(self.size.width/2, instructLabel.frame.origin.y - instructLabel.frame.height - 40);
        
        self.addChild(optionLabel)
        
        // black space color
        self.backgroundColor = SKColor.blackColor()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
        for touch in touches{
        let touchLocation = touch.locationInNode(self)
            print(tapLabelBox)
            print(touchLocation)
            
            if  tapLabelBox!.contains(touchLocation) {
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = .AspectFill
        
        self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }
            
            if blitzLabelBox!.contains(touchLocation) {
                let blitzScene = BlitzScene(size: self.size)
                blitzScene.scaleMode = .AspectFill
                self.view?.presentScene(blitzScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }
            if instructLabelBox!.contains(touchLocation) {
                let instructionScene = InstructionScene(size: self.size)
                instructionScene.scaleMode = .AspectFill
                self.view?.presentScene(instructionScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }
            
        }
    }
}

