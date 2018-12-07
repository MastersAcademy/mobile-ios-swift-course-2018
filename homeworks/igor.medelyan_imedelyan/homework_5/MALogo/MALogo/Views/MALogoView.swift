//
//  MALogoView.swift
//  MALogo
//
//  Created by Igor Medelyan on 12/7/18.
//  Copyright © 2018 Imedelyan. All rights reserved.
//

import UIKit

class MALogoView: UIView {

    override func draw(_ rect: CGRect) {
        // calculate lines width and padding
        let frameHeight = bounds.height
        let frameWidth = bounds.width
        let lineWidth = frameHeight > frameWidth ? frameWidth / 15 : frameHeight / 15
        let padding = lineWidth / 2
        
        // create path
        let path = UIBezierPath()
        path.move(to: CGPoint(x: padding, y: frameHeight - padding))
        path.addLine(to: CGPoint(x: padding, y: frameHeight / 3))
        path.addLine(to: CGPoint(x: frameWidth / 2, y: frameHeight * 2 / 3))
        path.addLine(to: CGPoint(x: frameWidth - padding, y: frameHeight / 3))
        path.addLine(to: CGPoint(x: frameWidth - padding, y: frameHeight - padding))
        path.addLine(to: CGPoint(x: padding, y: frameHeight - padding))
        path.addLine(to: CGPoint(x: frameWidth / 2, y: padding * 3))
        path.addLine(to: CGPoint(x: frameWidth - padding, y: frameHeight - padding))
        
        // create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.path = path.cgPath
        
        // animate drawing layer
        layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 4.0
        shapeLayer.add(animation, forKey: "Animation")
    }
}
