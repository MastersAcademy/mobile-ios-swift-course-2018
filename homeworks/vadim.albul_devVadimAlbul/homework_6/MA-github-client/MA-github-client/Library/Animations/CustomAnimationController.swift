//
//  FadeAnimationController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation
import UIKit

class CustomAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let presenting: Bool
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        let container = transitionContext.containerView
        
        let direction: CGFloat = presenting ? 1 : -1
        let const: CGFloat = -0.005
        
        toView.layer.anchorPoint = CGPoint(x: presenting ? 0 : 1, y: 0.5)
        fromView.layer.anchorPoint = CGPoint(x: presenting ? 1 : 0, y: 0.5)
        
        var fromTrasnform = CATransform3DMakeRotation(direction * .pi/2, 0.0, 1.0, 0.0)
        var toTransform = CATransform3DMakeRotation(-direction * .pi/2, 0.0, 1.0, 0.0)
        fromTrasnform.m34 = const
        toTransform.m34  = const
        
        container.transform = CGAffineTransform(translationX: direction * container.frame.width/2, y: 0)
        toView.layer.transform = toTransform
        container.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            container.transform = CGAffineTransform(translationX: -direction * container.frame.width/2, y: 0)
            fromView.layer.transform = fromTrasnform
            toView.layer.transform = CATransform3DIdentity
        }) { _ in
            container.transform = .identity
            fromView.layer.transform = CATransform3DIdentity
            toView.layer.transform = CATransform3DIdentity
            fromView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            let success = transitionContext.transitionWasCancelled
            if success {
                toView.removeFromSuperview()
            } else {
                fromView.removeFromSuperview()
            }
            transitionContext.completeTransition(!success)
        }
    }
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
}
