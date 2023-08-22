//
import UIKit

extension NSLayoutConstraint {
    
    // MARK: - Internal Methods
    func changeMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
        isActive = false
        newConstraint.priority = priority
        return newConstraint
    }
}
