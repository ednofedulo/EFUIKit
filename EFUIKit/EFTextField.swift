//
//  EFTextField.swift
//  EFUIKit
//
//  Created by Edno Fedulo on 11/07/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class EFTextField: UITextField {

    @IBInspectable var uiEdgeInsetsTop:CGFloat = 5
    @IBInspectable var uiEdgeInsetsLeft:CGFloat = 10
    @IBInspectable var uiEdgeInsetBottom:CGFloat = 5
    @IBInspectable var uiEdgeInsetsRight:CGFloat = 10
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = self.getUIEdgeInsets()
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = self.getUIEdgeInsets()
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = self.getUIEdgeInsets()
        return bounds.inset(by: padding)
    }
    
    private func getUIEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: self.uiEdgeInsetsTop, left: self.uiEdgeInsetsLeft, bottom: self.uiEdgeInsetBottom, right: self.uiEdgeInsetsRight)
    }
}

