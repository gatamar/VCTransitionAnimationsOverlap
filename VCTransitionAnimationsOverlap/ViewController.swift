//
//  ViewController.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationController?.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitioning()
    }
}

