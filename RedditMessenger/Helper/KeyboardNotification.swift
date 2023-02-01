//
//  KeyboardNotification.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 01.02.2023.
//

import Foundation
import UIKit

class KeyboardNotification {
    private var scrollView = UIScrollView()
    
    init(view: UIScrollView) {
        scrollView = view
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height - 35)
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    func gestureCloseKeyboard() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboardTap))
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(gestureRecognizer)
        scrollView.isUserInteractionEnabled = true
    }
    
    @objc private func closeKeyboardTap(_ gesture: UITapGestureRecognizer) {
        scrollView.endEditing(true)
    }
}
