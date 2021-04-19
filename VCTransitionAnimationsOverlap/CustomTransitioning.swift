//
//  CustomTransitioning.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class CustomTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    private let dur: TimeInterval = 5
    private var coloredView1: ColoredView? // cached for interruptible animations
    private var coloredView2: ColoredView? // cached for interruptible animations
    
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
        if let coloredView1 = self.coloredView1 {
            animatorForCurrentTransition?.addAnimations? {
                let curStoppedFrame = coloredView1.frame
                coloredView1.frame = newFrame.aspectFit(for: curStoppedFrame)
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
        
        let frame0_1 = CGRect(x: 0, y: 400, width: 100, height: 200)
        let frame0_2 = CGRect(x: toVC.view.frame.width-20, y: toVC.view.frame.height-80, width: 20, height: 80)
        
        coloredView1 = ColoredView(frame: frame0_1)
        coloredView1?.backgroundColor = .cyan
        coloredView2 = ColoredView(frame: frame0_2)
        coloredView2?.backgroundColor = .blue
        
        fromVC.view.addSubview(coloredView1!)
        fromVC.view.addSubview(coloredView2!)
        
        let animator = UIViewPropertyAnimator(duration: dur, curve: .linear)
        animator.addAnimations {
            self.coloredView1?.frame = fromVC.view.frame.aspectFit(for: frame0_1)
        }
        animator.addAnimations {
            self.coloredView2?.frame = fromVC.view.frame.aspectFit(for: frame0_2)
        }
        animator.addCompletion { (position) in
            print("Completion1: position = \(position)")
            
            // transition completed, reset the current animator:
            self.animatorForCurrentTransition = nil
            
            self.coloredView1?.removeFromSuperview()
            self.coloredView1 = nil
            
            self.coloredView2?.removeFromSuperview()
            self.coloredView2 = nil
            
            transitionContext.containerView.addSubview(toVC.view)
            //transitionContext.completeTransition(true)

            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        // keep the reference to current animator
        self.animatorForCurrentTransition = animator
        return animator
    }

}
