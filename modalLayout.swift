import UIKit

@IBDesignable
open class ModalView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0 
        }
    }
}

@IBDesignable
open class Cornerbutton: UIButton {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

class SmallerSwitch: UISwitch {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        transform = CGAffineTransform(scaleX: 0.80, y: 0.75)
    }
    
}