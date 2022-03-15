//
//  NSLayoutConstraint.swift
//  Tespo Health
//
//  Created by BrainX Technologies on 21/06/2020.
//  Copyright © 2020 BrainX Technologies. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    func changeMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        isActive = false
        newConstraint.priority = priority
        
        return newConstraint
    }
    
}
