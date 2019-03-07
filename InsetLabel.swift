//
//  InsetLabel.swift
//
//  Created by iEun on 2018. 10. 2..
//

import UIKit

@objc class InsetLabel: UILabel {
    
    @IBInspectable public var bottomInset: CGFloat {
        get { return insets.bottom }
        set { insets.bottom = newValue }
    }
    @IBInspectable public var leftInset: CGFloat {
        get { return insets.left }
        set { insets.left = newValue }
    }
    @IBInspectable public var rightInset: CGFloat {
        get { return insets.right }
        set { insets.right = newValue }
    }
    @IBInspectable public var topInset: CGFloat {
        get { return insets.top }
        set { insets.top = newValue }
    }
    
    @objc var insets: UIEdgeInsets = UIEdgeInsets.init();

    override func drawText(in rect: CGRect) {

        let size = self.sizeThatFits(UIEdgeInsetsInsetRect(rect, insets).size);
        super.drawText(in: CGRect.init(origin: CGPoint.init(x: insets.left, y: insets.top), size: size));
    }

    override var intrinsicContentSize: CGSize {
        
        var size = super.intrinsicContentSize;
        
        if text == nil || text?.count == 0 {
            return size;
        }
        
        size = self.sizeThatFits(UIEdgeInsetsInsetRect(CGRect.init(origin: CGPoint.zero, size: size), insets).size);
        size.width  += self.insets.left + self.insets.right;
        size.height += self.insets.top + self.insets.bottom;

        return size;
    }
}
