//
//  GameScene.swift
//  Joystick
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit



/*
 
 This example moves a physics object around the screen using a joy stick. 
 The Joystick class sets up a simple joy stick system. 
 The Joystick supplies two properties xValue, and yValue which range from 
 -1 to +1 You can use these values to control things in your scene. 
 In this example the values are used to apply force to a body. 
 
 The Joystick requires you send it show(), move(), and Hide() messages.
 
 Call show(touch: UITouch) in touchesBegan().
 This places the joystick at the location of the touch. 
 The
 
 Call move(touch: UITouch) in touchesMoved(). This updates the position of the 
 stick. 
 
 Call hode() in touchesEnded(). This hides the Joystick.
 
 */



class GameScene: SKScene {
    
    var joystick: Joystick! // Declare an instance of Joystick
    var ball: SKSpriteNode!
    var flame: SKEmitterNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Make a joystick
        joystick = Joystick()
        addChild(joystick)
        
        ball = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 30, height: 30))
        addChild(ball)
        ball.position.x = view.frame.width / 2
        ball.position.y = view.frame.height / 2
        ball.physicsBody = SKPhysicsBody(rectangleOfSize: ball.size)
        
        physicsBody = SKPhysicsBody(edgeLoopFromRect: view.frame)
        
        flame = SKEmitterNode(fileNamed: "Flame")
        ball.addChild(flame)
        flame.targetNode = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        // Show the joystick at the position of the touch.
        joystick.show(touches.first!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Send the joystick move messages to update the stick position.
        joystick.move(touches.first!)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Hide the joystick.
        joystick.hide()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        // Get the values from the joystick.
        // xValue ranges -1 to +1 on the x axis. 
        // yValue ranges -1 to +1 on the y axis. 
        let vector = CGVector(dx: joystick.xValue * 30, dy: joystick.yValue * 60)
        ball.physicsBody?.applyForce(vector)
    }
}
