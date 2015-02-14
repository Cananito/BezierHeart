//
//  HeartView.swift
//  BezierHeart
//
//  Created by Rogelio Gudino on 2/13/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import UIKit

@IBDesignable class HeartView: UIView {
    @IBInspectable var fillColor: UIColor = UIColor.redColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let minX = CGFloat(0.0)
        let maxX = CGRectGetWidth(rect)
        let centerX = CGRectGetWidth(rect) / 2.0
        let topUnionY = (CGRectGetHeight(rect) / 4.0)
        let bottomUnionY = CGRectGetHeight(rect) - (CGRectGetHeight(rect) / 10.0)
        
        let topControlPointY = -(CGRectGetHeight(rect) / 12.0)
        let bottomControlPointY = CGRectGetHeight(rect) - (topUnionY * 2.0)
        let topControlPointXDeltaFactor = CGFloat(maxX / 12.0)
        let bottomControlPointXDeltaFactor = CGFloat(maxX / 10.5)
        
        let topRightControlPoint = CGPointMake(maxX - topControlPointXDeltaFactor, topControlPointY)
        let topLeftControlPoint = CGPointMake(minX + topControlPointXDeltaFactor, topControlPointY)
        let bottomRightControlPoint = CGPointMake(maxX + bottomControlPointXDeltaFactor, bottomControlPointY)
        let bottomLeftControlPoint = CGPointMake(minX - bottomControlPointXDeltaFactor, bottomControlPointY)
        
        let topCenterPoint = CGPointMake(centerX, topUnionY)
        let bottomCenterPoint = CGPointMake(centerX, bottomUnionY)
        
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(topCenterPoint)
        bezierPath.addCurveToPoint(bottomCenterPoint, controlPoint1: topRightControlPoint, controlPoint2: bottomRightControlPoint)
        bezierPath.addCurveToPoint(topCenterPoint, controlPoint1: bottomLeftControlPoint, controlPoint2: topLeftControlPoint)
        bezierPath.closePath()
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddPath(context, bezierPath.CGPath)
        CGContextSetFillColorWithColor(context, self.fillColor.CGColor)
        CGContextFillPath(context)
    }
}
