import UIKit
import Foundation

extension UIView {
    
    // MARK: - Static Properties
    static var identifierForView: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    static func nibForView() -> UINib {
        return UINib(nibName: self.identifierForView, bundle: nil)
    }
    
    // MARK: - Internal Methods
    func setBorderColor(_ color: UIColor, andWidth width: CGFloat = 1.0){
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
        layer.cornerRadius = r
        layer.masksToBounds = clip
    }
    
    func setCornerRadius(_ r: CGFloat, forCorners corners: CACornerMask, andClipContent clip: Bool = false) {
        layer.maskedCorners = corners
        setCornerRadius(r, andClipContent: clip)
    }
    
    func addShadow(color: UIColor = Color.shadow,
                   alpha: Float = 1,
                   x: CGFloat = 0,
                   y: CGFloat = 2,
                   radius: CGFloat = 2 ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = alpha
        layer.shadowRadius = radius
    }
    
    @discardableResult
    func addGradient(_ direction: GradientDirection, withColor colors: [UIColor], cornerRadius: CGFloat = 0, shouldPushInBackground: Bool = true) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        if shouldPushInBackground {
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            layer.addSublayer(gradientLayer)
        }
        return gradientLayer
    }
}
