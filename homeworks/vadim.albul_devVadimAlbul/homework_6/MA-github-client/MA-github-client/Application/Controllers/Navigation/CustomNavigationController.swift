//
//  BasicNavigationController.swift
//  MA-github-client
//
//  Created by Vadim Albul on 12/16/18.
//  Copyright © 2018 MA. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    private var interactionController: UIPercentDrivenInteractiveTransition?
    private var edgeSwipeGestureRecognizer: UIScreenEdgePanGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        edgeSwipeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        edgeSwipeGestureRecognizer!.edges = .left
        view.addGestureRecognizer(edgeSwipeGestureRecognizer!)
    }
    
    @objc func handleSwipe(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        let percent = gestureRecognizer.translation(in: gestureRecognizer.view!).x / gestureRecognizer.view!.bounds.size.width
        
        switch gestureRecognizer.state {
        case .began:
            interactionController = UIPercentDrivenInteractiveTransition()
            popViewController(animated: true)
        case .changed:
            interactionController?.update(percent)
        case .ended:
            if percent > 0.5 && gestureRecognizer.state != .cancelled {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
        default: break
        }
    }

}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimationController(presenting: operation == .push )
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
