import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var roundRadius: Bool {
        get {
            return layer.cornerRadius == frame.height/2
        }
        set {
            layer.cornerRadius = (newValue ? frame.height/2 : 0)
        }
    }
    
    @IBInspectable
    var clipping: Bool {
        get {
            return clipsToBounds
        }
        set {
            clipsToBounds = newValue
        }
    }
}

@IBDesignable
class DesignImageView: UIImageView {
    @IBInspectable
    var clips: Bool {
        get {
            return self.clipsToBounds
        }
        set {
            self.clipsToBounds = newValue
        }
    }
}

@IBDesignable
class DesignButton: UIButton {}

@IBDesignable
class DesignLabel: UILabel {}

@IBDesignable
class DesignView: UIView {}

@IBDesignable
class DesignTextField: UITextField {}

@IBDesignable
class DesignTextView: UITextView {}

@IBDesignable
class DesignViewBlur: UIVisualEffectView {}

@IBDesignable
class DesignCollectionViewCell: UICollectionViewCell {}

@IBDesignable
class DesignCollectionView: UICollectionView {}

