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
    
    @IBOutlet weak var inputViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextView()
        registerKeyboardNotifications()
    }
    
    private func configureTextView() {
        growingTextView.layer.cornerRadius = 6
        growingTextView.font = UIFont.systemFont(ofSize: 15)
        growingTextView.minHeight = 35
        growingTextView.clipsToBounds = true
        growingTextView.delegate = self
        growingTextView.placeholder = "说点什么吧"
    }

    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func onKeyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        inputViewBottomConstraint.constant = keyboardFrame.height
        view.layoutIfNeeded()
    }
    
    @objc private func onKeyboardWillHide(_ notification: Notification) {
        
    }
    
    //@objc private func onKeyb
}

extension ViewController: WXGrowingTextViewDelegate {
    
    func growingTextView(_ growingTextView: WXGrowingTextView, willChangeHeight height: CGFloat) {
        textViewHeightConstraint.constant = height
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func growingTextView(_ growingTextView: WXGrowingTextView, didChangeHeight height: CGFloat) {
        
    }
    
}
