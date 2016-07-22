//
//  Joystick.swift
//  Joystick
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import SpriteKit





class Joystick: SKNode {
    let joystick: SKShapeNode
    let stick: SKShapeNode
    
    let maxRange:CGFloat = 50
    
    var xValue: CGFloat = 0
    var yValue: CGFloat = 0
    
    
    
    
    
    func show(touch: UITouch) {
        hidden = false
        position = touch.locationInNode(parent!)
    }
    
    func move(touch: UITouch) {
        let p = touch.locationInNode(self)
        let x = p.x.clamped(-maxRange, maxRange)
        let y = p.y.clamped(-maxRange, maxRange)
        
        stick.position = CGPoint(x: x, y: y)
        xValue = x / maxRange
        yValue = y / maxRange
    }
    
    func hide() {
        hidden = true
        stick.position = CGPointZero
        xValue = 0
        yValue = 0
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    
    
    
    
    override init() {
        let joystickRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let joystickPath = UIBezierPath(ovalInRect: joystickRect)
        
        joystick = SKShapeNode(path: joystickPath.CGPath, centered: true)
        joystick.lineWidth = 2
        joystick.strokeColor = UIColor.whiteColor()
        joystick.fillColor = UIColor(white: 1, alpha: 0.5)
        
        let stickRect = CGRect(x: 0, y: 0, width: 40, height: 40)
        let stickPath = UIBezierPath(ovalInRect: stickRect)
        
        stick = SKShapeNode(path: stickPath.CGPath, centered: true)
        stick.lineWidth = 2
        stick.strokeColor = UIColor(white: 0.2, alpha: 1)
        stick.fillColor = UIColor(white: 0, alpha: 0.5)
        
        super.init()
        
        addChild(joystick)
        joystick.addChild(stick)
        
        hidden = true
        userInteractionEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





extension CGFloat {
    /**
     * Ensures that the float value stays between the given values, inclusive.
     */
    public func clamped(v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        let min = v1 < v2 ? v1 : v2
        let max = v1 > v2 ? v1 : v2
        return self < min ? min : (self > max ? max : self)
    }
    
    /**
     * Ensures that the float value stays between the given values, inclusive.
     */
    public mutating func clamp(v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        self = clamped(v1, v2)
        return self
    }
}

