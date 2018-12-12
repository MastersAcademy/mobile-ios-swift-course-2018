//
//  MALogoView.swift
//  MALogo
//
//  Created by Myhovych on 1/11/2018.
//  Copyright © 2018 Artem Migovich. All rights reserved.
//

import Foundation
import UIKit.UIView

class MALogoView: UIView {
    override func draw(_ rect: CGRect) {

        let x = self.bounds.width / 2
        let y = self.bounds.height / 2
        let center: CGPoint = CGPoint(x: x, y: y)
        
        let logo = UIBezierPath()
        logo.move(to: CGPoint(x: 100, y: y + 50))
        logo.addLine(to: CGPoint(x: 100, y: y - 100))
        logo.addLine(to: center)
        logo.addLine(to: CGPoint(x: x * 2 - 100, y: y - 100))
        logo.addLine(to: CGPoint(x: x * 2 - 100, y: y + 50))
        logo.close()
        logo.move(to: CGPoint(x: 100, y: y + 50))
        logo.addLine(to: CGPoint(x: x, y: y - 175))
        logo.addLine(to: CGPoint(x: x * 2 - 100, y: y + 50))
        UIColor.white.setStroke()
        logo.stroke()
        
        let shapeLayer = CAShapeLayer()

        shapeLayer.lineWidth = 15
        shapeLayer.frame = self.layer.bounds
        shapeLayer.path = logo.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
 
        self.layer.addSublayer(shapeLayer)

        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 2.0
        strokeEndAnimation.duration = 4.0
        shapeLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
    }
}
