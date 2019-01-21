//
//  ViewController.swift
//  KeyboardControllers
//
//  Created by Hector Mendoza on 1/21/19.
//  Copyright © 2019 Hector Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var keyboardHeight: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardNotifications()
    }
    
}

//MARK: - Keyboard Control Methods
extension ViewController {
    
    func addKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardSize.cgRectValue
        keyboardHeight = keyboardFrame.height
        
        view.frame.size.height -= keyboardHeight
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.size.height += keyboardHeight
    }
    
    //We hide the keyboard when touched outside textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

