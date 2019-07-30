//
//  Extensions.swift
//  MockExams
//
//  Created by Dhaval on 22/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class Extensions: NSObject {

}


extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    
    //    NOTE: TO END EDITING IN UICOLLECTIONVIEW CELL I HAVE ADDED TOUCHUPENDED METHOD IN EXTENTION OF UIVIEW SO IT WILL APPLY TO EACH UIVIEW IN ENTIRE APP
    //    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        self.endEditing(true)
    //    }
    
}
