//
//  FlipAnimationController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/17/18.
//  Copyright © 2018 MA. All rights reserved.
//

import Foundation
import UIKit

class FlipAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum TransitionType {
        case presenting
        case dismissing
    }
    
    let transitionType: TransitionType
    
    init(transitionType: TransitionType) {
        self.transitionType = transitionType
        
        super.init()
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let inView  = transitionContext.containerView
        guard let toView   = transitionContext.view(forKey: .to) else { return }
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        let toTabView = transitionContext.viewController(forKey: .to)?.tabBarController?.tabBar
        let fromTabView = transitionContext.viewController(forKey: .from)?.tabBarController?.tabBar
        
        var frame = inView.bounds
        
        func flipTransform(angle: CGFloat, offset: CGFloat = 0) -> CATransform3D {
            var transform = CATransform3DMakeTranslation(offset, 0, 0)
            transform.m34 = -1.0 / 1600
            transform = CATransform3DRotate(transform, angle, 0, 1, 0)
            return transform
        }
        
        toView.frame = inView.bounds
        toView.alpha = 0
        
        let transformFromStart:  CATransform3D
        let transformFromEnd:    CATransform3D
        let transformFromMiddle: CATransform3D
        let transformToStart:    CATransform3D
        let transformToMiddle:   CATransform3D
        let transformToEnd:      CATransform3D
        
        switch transitionType {
        case .presenting:
            transformFromStart  = flipTransform(angle: 0,        offset: inView.bounds.size.width / 2)
            transformFromEnd    = flipTransform(angle: -.pi,     offset: inView.bounds.size.width / 2)
            transformFromMiddle = flipTransform(angle: -.pi / 2)
            transformToStart    = flipTransform(angle: .pi,      offset: -inView.bounds.size.width / 2)
            transformToMiddle   = flipTransform(angle: .pi / 2)
            transformToEnd      = flipTransform(angle: 0,        offset: -inView.bounds.size.width / 2)
            
            toView.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
            fromView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        case .dismissing:
            transformFromStart  = flipTransform(angle: 0,        offset: -inView.bounds.size.width / 2)
            transformFromEnd    = flipTransform(angle: .pi,      offset: -inView.bounds.size.width / 2)
            transformFromMiddle = flipTransform(angle: .pi / 2)
            transformToStart    = flipTransform(angle: -.pi,     offset: inView.bounds.size.width / 2)
            transformToMiddle   = flipTransform(angle: -.pi / 2)
            transformToEnd      = flipTransform(angle: 0,        offset: inView.bounds.size.width / 2)
            
            toView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
            fromView.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        }
        
        toView.layer.transform = transformToStart
        fromView.layer.transform = transformFromStart
        inView.addSubview(toView)
        fromTabView?.alpha = 0
        toTabView?.alpha = 0
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext), delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.0) {
                toView.alpha = 0
                fromView.alpha = 1
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                toView.layer.transform = transformToMiddle
                fromView.layer.transform = transformFromMiddle
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.0) {
                toView.alpha = 1
                fromView.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                toView.layer.transform = transformToEnd
                fromView.layer.transform = transformFromEnd
            }
        }, completion: { finished in
            
            let transitionWasCancelled = transitionContext.transitionWasCancelled
            toView.layer.transform = CATransform3DIdentity
            fromView.layer.transform = CATransform3DIdentity
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            fromView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            fromTabView?.alpha = 1
            toTabView?.alpha = 1
            transitionContext.completeTransition(!transitionWasCancelled)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
}
