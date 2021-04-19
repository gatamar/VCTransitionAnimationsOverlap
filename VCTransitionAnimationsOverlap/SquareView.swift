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
