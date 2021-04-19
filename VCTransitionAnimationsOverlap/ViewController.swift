//
//  ViewController.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    private var customTransitionDriver: CustomTransitioning?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customTransitionDriver = CustomTransitioning()
        return customTransitionDriver
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        customTransitionDriver?.stopTransitioningAnimationASAP()
        
        coordinator.animate { (context) in
            self.customTransitionDriver?.animateOrangeViewToNewRect(CGRect(origin: .zero, size: size))
        } completion: { (context) in
            
        }

    }
}

