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
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        let frame0 = CGRect(x: 0, y: 100, width: 200, height: 200)
        let frame1 = CGRect(x: 200, y: 300, width: 200, height: 200)
        let orangeView = OrangeView(frame: frame0)

        fromVC.view.addSubview(orangeView)
        UIView.animate(withDuration: dur) {
            
            orangeView.frame = frame1
            
        } completion: { (finished) in
            orangeView.removeFromSuperview()
            transitionContext.containerView.addSubview(toVC.view)
            transitionContext.completeTransition(true)
        }

    }
    
}
