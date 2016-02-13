//
//  GameOverScene.swift
//  GameTest2
//
//  Created by Zack Shepard on 1/24/16.
//  Copyright © 2016 Zack Shepard. All rights reserved.
//

import UIKit
import SpriteKit

var topScores = [Int] (count: 10, repeatedValue: 0)

class GameOverScene: SKScene {
    
    // Private GameScene Properties
    
    var contentCreated = false
    var tapLabelBox: CGRect?
    var menuLabelBox: CGRect?
    var scoreString = "Top Scores "
    var topScoreLabel:UITextView?
    
    
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    func createContent() {
        print(accuracyRating)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLabel.fontSize = 50
        gameOverLabel.fontColor = SKColor.whiteColor()
        gameOverLabel.text = "Game Over!"
        gameOverLabel.position = CGPointMake(self.size.width/2, frame.size.height-50);
        
        self.addChild(gameOverLabel)
        
        let tapLabel = SKLabelNode(fontNamed: "Chalkduster")
        tapLabel.fontSize = 25
        tapLabel.fontColor = SKColor.whiteColor()
        tapLabel.text = "Tap to Play Again"
        tapLabel.position = CGPointMake(self.size.width/2, gameOverLabel.frame.origin.y - gameOverLabel.frame.size.height - 150);
        
        self.addChild(tapLabel)
        
        let accuracyLabel = SKLabelNode(fontNamed: "Chalkduster")
        accuracyLabel.fontSize = 25
        accuracyLabel.fontColor = SKColor.whiteColor()
        accuracyLabel.text = String(format: "Accuracy: %.1f",accuracyRating)
        accuracyLabel.position = CGPoint(x: tapLabel.position.x, y: tapLabel.position.y + 50)
        
        self.addChild(accuracyLabel)
        
       // print(scorePoints)
       // let scoreRect = CGRectMake(gameOverLabel.position.x - gameOverLabel.frame.width/2 , tapLabel.position.y + tapLabel.frame.height/2, gameOverLabel.frame.width, CGFloat(100))
        
       /* topScoreLabel =  UITextView(frame:  scoreRect)
        topScoreLabel!.textColor = SKColor.greenColor()
        topScoreLabel!.editable = false
        topScores.sort(>)
        print(topScores.sort(>))
        //topScores = topScores.sort(>)
        for var i = 0; i < topScores.count; ++i{
            if scorePoints > topScores[i] {
            //if topScores[i] == 0 {
                //topScores[i + 1] = topScores[i]
                topScores[9] = scorePoints
                break
            }
            
        }
        topScores = topScores.sort(>)
      //  topScores[] +=
       
        print(topScores)
       // print(topScores[0])
        //print(topScores[1])
        
        //topScores.sortInPlace(>)
        for var i = 0; i < topScores.count; ++i{
           scoreString = scoreString + String(i + 1) + ":" + String(topScores[i]) + " "
        }
        print(scoreString)
        //topScores[0] = scorePoints*/
        /*topScoreLabel!.text = scoreString
        topScoreLabel!.backgroundColor = SKColor.blackColor()
        topScoreLabel?.font = UIFont(name: "Chalkduster", size: 25)*/
       // scoreLabel.
        //scoreLabel.fontColor = SKColor.greenColor()
        //scoreLabel.text = String(format: "Top Scores 1: %04u", topScores[0],"2:", topScores[1], "3:", topScores[2],"4:", topScores[3],"5:", topScores[4],"6:", topScores[5],"7:", topScores[6],"8:", topScores[7],"9:", topScores[8],"10:", topScores[9])
        //topScoreLabel.position = CGPointMake(self.size.width/2, gameOverLabel.frame.origin.y - gameOverLabel.frame.size.height - 20);
       // scoreLabel.text = String(topScores)
       // scoreLabel.text = String(format: "1:  2:")
        
        //self.view?.addSubview(topScoreLabel!)
        
        let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.fontSize = 25
        scoreLabel.fontColor = SKColor.greenColor()
        scoreLabel.text = String(format: "Your Score %04u", scorePoints)
        scoreLabel.position = CGPointMake(self.size.width/2, gameOverLabel.frame.origin.y - gameOverLabel.frame.size.height - 50);
        
        self.addChild(scoreLabel)
        
        
        
        let tapLabelOrigin = CGPointMake(tapLabel.position.x - tapLabel.frame.width/2, tapLabel.position.y - tapLabel.frame.height/2)
        //let tapLabelCorner = CGPointMake(tapLabel.position.x + 20, tapLabel.position.y + 20)
        let tapLabelSize = CGSize(width: tapLabel.frame.width , height: tapLabel.frame.height)
        
        tapLabelBox = CGRectMake(tapLabelOrigin.x, tapLabelOrigin.y, tapLabelSize.width, tapLabelSize.height)
        
        let menuLabel = SKLabelNode(fontNamed: "Chalkduster")
        menuLabel.fontSize = 25
        menuLabel.fontColor = SKColor.whiteColor()
        menuLabel.text = "Back to Menu"
        menuLabel.position = CGPointMake(self.size.width/2, tapLabel.frame.origin.y - tapLabel.frame.size.height - 80);
        
        self.addChild(menuLabel)
        
        let menuLabelOrigin = CGPointMake(menuLabel.position.x - menuLabel.frame.width/2, menuLabel.position.y - menuLabel.frame.height/2)
        let menuLabelSize = CGSize(width: menuLabel.frame.width , height: menuLabel.frame.height)
        
        menuLabelBox = CGRectMake(menuLabelOrigin.x, menuLabelOrigin.y, menuLabelSize.width, menuLabelSize.height)
        
        let streakLabel = SKLabelNode(fontNamed: "Chalkduster")
        streakLabel.fontSize = 25
        streakLabel.fontColor = SKColor.redColor()
        streakLabel.text = String(format: "Top Streak: %u", topStreak)
        streakLabel.position = CGPoint(x:self.size.width/2 , y: self.frame.height - 100)
        
        self.addChild(streakLabel)
        
        // black space color
        self.backgroundColor = SKColor.blackColor()
        scorePoints = 0
        topStreak = 0
        accuracyRating = 0
        
      /*  let streakLabel = SKLabelNode(fontNamed: "Chalkduster")
        streakLabel.fontSize = 20
        streakLabel.fontColor = SKColor.redColor()
        streakLabel.text = String(format: "Streak Multiplier", scoreMultipier)
        */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)  {
        
        for touch in touches {
            let touchLocation = touch.locationInNode(self)
            
            if  tapLabelBox!.contains(touchLocation) {
                self.topScoreLabel?.removeFromSuperview()
                //self.view.t
        
                //let gameScene = NSClassFromString(sceneScene)as? SKScene
                //let gameScene = SceneClass(GameScene)
                if sceneScene == "GameScene"{
                let gameScene = GameScene(size: self.size)
                gameScene.scaleMode = .AspectFill
        
                self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
                }
                if sceneScene == "BlitzScene"{
                    let blitzScene = BlitzScene(size: self.size)
                    blitzScene.scaleMode = .AspectFill
                    
                    self.view?.presentScene(blitzScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
                }
            }
            if menuLabelBox!.contains(touchLocation) {
                 self.topScoreLabel?.removeFromSuperview()
                let startScene = StartScene(size: self.size)
                startScene.scaleMode = .AspectFill
                
                self.view?.presentScene(startScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            }
        }
    }
}
