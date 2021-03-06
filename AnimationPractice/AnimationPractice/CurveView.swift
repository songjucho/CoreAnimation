//
//  CurveView.swift
//  AnimationPractice
//
//  Created by 송주 on 2020/12/13.
//

import UIKit

class CurveView: UIView, CAAnimationDelegate {
    
    func getEndAngle(startAngle: CGFloat, angle: CGFloat) -> CGFloat {
        return (angle * (.pi / 180)) + startAngle
    }
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.systemBlue.cgColor
        let path = UIBezierPath()
        
        let width = self.frame.width
        let height = self.frame.height
        
        path.move(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addCurve(to: CGPoint(x: width * 0.26, y: height * 0.12), controlPoint1: CGPoint(x: 0, y: height), controlPoint2: CGPoint(x: 0, y: height * 0.12))
        path.addQuadCurve(to: CGPoint(x: width * 0.4, y: height * 0.43), controlPoint: CGPoint(x: self.frame.width, y: height * 0.18))
        path.addQuadCurve(to: CGPoint(x: 0, y: height * 0.86), controlPoint: CGPoint(x: width * 1.26, y: height * 0.55))
        
        let paintAnimation = CABasicAnimation(keyPath: "strokeEnd")
        paintAnimation.fromValue = 0
        paintAnimation.toValue = 1
        paintAnimation.duration = 2
        paintAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        paintAnimation.delegate = self
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = CGFloat(0.75 * Double.pi)
        rotateAnimation.toValue = CGFloat(Double.pi)
        rotateAnimation.duration = 2
        
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        positionAnimation.path = path.cgPath
        positionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        positionAnimation.rotationMode = .rotateAuto
        
        let imageLayer = CALayer()
        let image2 = UIImage(systemName: "trash")?.cgImage
        imageLayer.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageLayer.position = CGPoint(x: self.frame.width, y: self.frame.height)
        imageLayer.contents = image2
        self.layer.addSublayer(imageLayer)

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotateAnimation, positionAnimation]
        animationGroup.duration = 2
        animationGroup.delegate = self
        animationGroup.autoreverses = false
        animationGroup.isRemovedOnCompletion = true
        imageLayer.add(animationGroup, forKey: "multipleAnimationsKey")
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 2
        layer.strokeEnd = 1
        layer.lineDashPattern = [NSNumber(integerLiteral: 10)]
        layer.add(paintAnimation, forKey: paintAnimation.keyPath)
        self.layer.addSublayer(layer)
    }
    
    
}
