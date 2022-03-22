import UIKit

extension UIFont {
    
    // MARK: - Static Methods
    static func setFontProximaNovaRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Regular", size: size)
    }
    
    static func setFontProximaNovaBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Bold", size: size)
    }
    
    static func setFontProximaNovaMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "ProximaNova-Medium", size: size)
    }
}
