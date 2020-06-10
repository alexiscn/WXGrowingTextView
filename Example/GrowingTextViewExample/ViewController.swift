//
//  ViewController.swift
//  GrowingTextViewExample
//
//  Created by xu.shuifeng on 2020/6/9.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXGrowingTextView

class ViewController: UIViewController {

    @IBOutlet weak var growingTextView: WXGrowingTextView!
    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        growingTextView.layer.cornerRadius = 6
        growingTextView.font = UIFont.systemFont(ofSize: 15)
        growingTextView.minHeight = 35
        growingTextView.clipsToBounds = true
        growingTextView.delegate = self
        growingTextView.placeholder = "说点什么吧"
        // Do any additional setup after loading the view.
    }


}

extension ViewController: WXGrowingTextViewDelegate {
    
    func growingTextView(_ growingTextView: WXGrowingTextView, willChangeHeight height: CGFloat) {
        textViewHeightConstraint.constant = height
    }
    
    func growingTextView(_ growingTextView: WXGrowingTextView, didChangeHeight height: CGFloat) {
        
    }
    
}
