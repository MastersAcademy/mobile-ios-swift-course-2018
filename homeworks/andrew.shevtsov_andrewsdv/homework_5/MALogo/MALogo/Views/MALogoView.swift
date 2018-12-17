//
//  MALogoView.swift
//  MALogo
//
//  Created by Andrew Shevtsov on 12/8/18.
//  Copyright © 2018 Andrew Shevtsov. All rights reserved.
//

import UIKit

class MALogoView : UIView {
    
    override func draw(_ rect: CGRect) {
        let viewHeight = bounds.height
        let viewWidth = bounds.width
        let lineThickness = CGFloat(15)
        
        let path = preparePath(viewHeight, viewWidth, lineThickness)
        let animation = setupAnimation()
        let shapeLayer = prepareShape(lineThickness, path, animation)
        
        layer.addSublayer(shapeLayer)
    }
    
    private func preparePath(_ viewHeight: CGFloat, _ viewWidth: CGFloat, _ lineThickness: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: viewHeight))
        path.addLine(to: CGPoint(x: 0, y: viewHeight / 3))
        path.addLine(to: CGPoint(x: viewWidth / 2, y: viewHeight * 2 / 3))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight / 3))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        path.addLine(to: CGPoint(x: 0, y: viewHeight))
        path.addLine(to: CGPoint(x: 0, y: viewHeight - lineThickness))
        path.addLine(to: CGPoint(x: viewWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight - lineThickness))
        return path
    }
    
    fileprivate func prepareShape(_ lineThickness: CGFloat, _ path: UIBezierPath, _ animation: CABasicAnimation) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = lineThickness
        shapeLayer.path = path.cgPath
        shapeLayer.add(animation, forKey: "Animation")
        return shapeLayer
    }
    
    fileprivate func setupAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 5.0
        return animation
    }
}
