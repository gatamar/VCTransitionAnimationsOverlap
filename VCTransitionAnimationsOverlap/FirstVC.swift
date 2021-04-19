//
//  FirstVC.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addRunBtn()
    }

    private func addRunBtn() {
        let w: CGFloat = 100
        let runBtn = UIButton(frame: CGRect(x: view.frame.width-w, y: 0, width: w, height: 40))
        runBtn.backgroundColor = .blue
        runBtn.setTitle("Run", for: .normal)
        runBtn.addTarget(self, action: #selector(runBtnPressed), for: .touchUpInside)
        view.addSubview(runBtn)
    }

    @objc func runBtnPressed() {
        let vc2 = SecondVC()
        parent!.addChild(vc2)
        
        assert(parent == vc2.parent && self.parent != nil)
        
        parent!.transition(from: self, to: vc2, duration: 2, options: .curveLinear) {
        
        } completion: { (finished) in
            
        }

    }
}

