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
}

@IBDesignable
class DesignImageView: UIImageView {}

@IBDesignable
class DesignButton: UIButton {}

@IBDesignable
class DesignLabel: UILabel {}

@IBDesignable
class DesignView: UIView {}

@IBDesignable
class DesignTextField: UITextField {
    @IBInspectable
    var placeholderColor: UIColor {
        get {
            return value(forKeyPath: "placeholderLabel.textColor") as? UIColor ?? .white
        }
        set {
            setValue(newValue, forKeyPath: "placeholderLabel.textColor")
        }
    }
}

@IBDesignable
class DesignNavigationBar: UINavigationBar {
    @IBInspectable
    var shouldHaveShadow: Bool {
        get {
            return shadowImage != UIImage()
        }
        set {
            shadowImage = newValue ? nil : UIImage()
        }
    }
}

@IBDesignable
class DesignTextView: UITextView {}

@IBDesignable
class DesignViewBlur: UIVisualEffectView {}

@IBDesignable
class DesignCollectionViewCell: UICollectionViewCell {}

@IBDesignable
class DesignCollectionView: UICollectionView {}
