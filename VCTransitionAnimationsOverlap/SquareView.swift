//
//  SquareView.swift
//  VCTransitionAnimationsOverlap
//
//  Created by Olha Pavliuk on 19.04.2021.
//

import UIKit

class OrangeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CGRect {
    func aspectFit(for r: CGRect) -> CGRect {
        let scale = min(width/r.width, height/r.height)
        let c = CGPoint(x: origin.x+width/2, y: origin.y+height/2)
        let wScaled = r.width*scale
        let hScaled = r.height*scale
        return CGRect(x: c.x-wScaled/2, y: c.y-hScaled/2, width: wScaled, height: hScaled)
    }
}

