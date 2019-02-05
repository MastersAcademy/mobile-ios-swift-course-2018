//
//  MALogoView.swift
//  MALogo
//
//  Created by Dan on 12/8/18.
//  Copyright © 2018 Dan Viitenko. All rights reserved.
//

import UIKit


class MALogoView: UIView {

    override func draw(_ rect: CGRect) {
        
        let width = bounds.width
        let height = bounds.height
        let halfWidth = bounds.width / 2
        let halfHeight = bounds.height / 2
        let borderTriangle: CGFloat = 10.0
        let border: CGFloat = 8.0
      
        let path = UIBezierPath()
        path.move(to: CGPoint(x: halfWidth, y: height - (height - borderTriangle)))
        path.addLine(to: CGPoint(x: width - (width - borderTriangle),y: height - borderTriangle))
        path.addLine(to: CGPoint(x: width - borderTriangle,y: height - borderTriangle))
        path.close()
        
        path.move(to: CGPoint(x: width - (width - border),y: height - border))
        path.addLine(to: CGPoint(x: width - (width - border),y: halfHeight / 2 ))
        path.addLine(to: CGPoint(x: halfWidth,y: halfHeight * 1.5))
        path.addLine(to: CGPoint(x: width - border,y: halfHeight / 2))
        path.addLine(to: CGPoint(x: width - border,y: height - border))
        UIColor.red.setStroke()
        path.lineWidth = 8.0
        
        path.stroke()

        }
    }
    


