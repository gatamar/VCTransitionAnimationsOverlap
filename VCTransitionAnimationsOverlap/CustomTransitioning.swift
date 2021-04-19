//
//  CustomTransitioning.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class CustomTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    private let dur: TimeInterval = 5
    private var orangeView: OrangeView? // cached for interruptible animations
    
    // property for keeping the animator for current ongoing transition
    private var animatorForCurrentTransition: UIViewImplicitlyAnimating?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return dur
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // animateTransition should work too, so let's just use the interruptibleAnimator implementation to achieve it
        let anim = self.interruptibleAnimator(using: transitionContext)
        anim.startAnimation()
    }
        
    func changeAnimationDestinationOnFly(_ newFrame: CGRect) {
        animatorForCurrentTransition?.stopAnimation(true)
        if let orangeView = self.orangeView {
            animatorForCurrentTransition?.addAnimations? {
                let curStoppedFrame = orangeView.frame
                orangeView.frame = newFrame.aspectFit(for: curStoppedFrame)
            }
            animatorForCurrentTransition?.startAnimation()
        }
    }
    
    // Like here: https://stackoverflow.com/a/48090690/2567725
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        // as per documentation, the same object should be returned for the ongoing transition
        if let animatorForCurrentSession = animatorForCurrentTransition {
            return animatorForCurrentSession
        }
        
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        let frame0 = CGRect(x: 0, y: 400, width: 100, height: 200)
        let frame1 = fromVC.view.frame.aspectFit(for: frame0)
        orangeView = OrangeView(frame: frame0)
        fromVC.view.addSubview(orangeView!)
        
        let animator = UIViewPropertyAnimator(duration: dur, curve: .linear)
        animator.addAnimations {
            self.orangeView?.frame = frame1
        }
        animator.addCompletion { (position) in
            switch position {
            case .end:
                print("Completion handler called at end of animation")
                break
            case .current:
                print("Completion handler called mid-way through animation")
                break
            case .start:
                print("Completion handler called  at start of animation")
                break
            @unknown default:
                break
            }
            // transition completed, reset the current animator:
            self.animatorForCurrentTransition = nil
            
            self.orangeView?.removeFromSuperview()
            self.orangeView = nil
            transitionContext.containerView.addSubview(toVC.view)
            //transitionContext.completeTransition(true)

            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        // keep the reference to current animator
        self.animatorForCurrentTransition = animator
        return animator
    }

}
