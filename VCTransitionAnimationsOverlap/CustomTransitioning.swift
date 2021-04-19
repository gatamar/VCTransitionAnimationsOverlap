//
//  CustomTransitioning.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class CustomTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    private let dur: TimeInterval = 3
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return dur
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to)!
        UIView.animate(withDuration: dur) {
            
            // do smth real here
            
        } completion: { (finished) in
            transitionContext.containerView.addSubview(toVC.view)
            transitionContext.completeTransition(true)
        }

    }
    
}
