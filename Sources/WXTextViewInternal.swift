//
//  WXTextViewInternal.h
//  WXGrowingTextView
//
//  Created by xu.shuifeng on 2020/6/9.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit

public class WXTextViewInternal: UITextView {
    
    private var isScrollEnabledTemp = false
    
    public override var text: String! {
        willSet {
            // If one of GrowingTextView's superviews is a scrollView, and self.scrollEnabled is false,
            // setting the text programatically will cause UIKit to search upwards until it finds a scrollView with scrollEnabled true,
            // then scroll it erratically. Setting scrollEnabled temporarily to true prevents this.
            isScrollEnabledTemp = self.isScrollEnabled
            isScrollEnabled = true
        }
        didSet {
            isScrollEnabled = isScrollEnabledTemp
        }
    }
    
    /// A Boolean value indicating whether the receiver displays placeholder.
    public var displayPlaceholder: Bool = true
    
    public var placeholder: String? = nil {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var placeholderColor: UIColor?
    
    public var placeholderFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let placehoder = placeholder, displayPlaceholder else {
            return
        }
        
        let size = (placehoder as NSString).size(withAttributes: [
            .font: placeholderFont
        ])
        let x = textContainer.lineFragmentPadding + textContainerInset.left
        let y = (bounds.height - size.height)/2.0
        let rect = CGRect(x: x, y: y, width: size.width, height: size.height)
        (placehoder as NSString).draw(in: rect, withAttributes: nil)
    }
}
