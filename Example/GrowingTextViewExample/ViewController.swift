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

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var growingTextView: WXGrowingTextView!
    
    @IBOutlet weak var inputViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var inputViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
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
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.keyboardDismissMode = .onDrag
    }

    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func onKeyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        inputViewBottomConstraint.constant = keyboardFrame.height - view.safeAreaInsets.bottom
        view.layoutIfNeeded()
    }
    
    @objc private func onKeyboardWillHide(_ notification: Notification) {
        view.setNeedsLayout()
        self.inputViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = "Row:\(indexPath.row)"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - WXGrowingTextViewDelegate
extension ViewController: WXGrowingTextViewDelegate {
    
    func growingTextView(_ growingTextView: WXGrowingTextView, willChangeHeight height: CGFloat) {
        inputViewHeightConstraint.constant = height + 14
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func growingTextView(_ growingTextView: WXGrowingTextView, didChangeHeight height: CGFloat) {
        
    }
    
}
