//
//  ScrollTestingViewController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 25/01/23.
//

import UIKit

class ScrollTestingViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerForKeyboardNotifications()


    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShown(_:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(keyboardWillBeHidden(_:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @objc func keyboardWillShown(_ notificiation: NSNotification) {

        // write source code handle when keyboard will show

        guard let keyboardSize = (notificiation.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }

//        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + keyboardSize.height)
        scrollView.contentSize.height = scrollView.contentSize.height + keyboardSize.height

        let inset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height , right: 0)
        scrollView.contentInset = inset

        // Keyboard's animation duration
        let keyboardDuration = notificiation.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double

        // Keyboard's animation curve
        let keyboardCurve = UIView.AnimationCurve(rawValue: notificiation.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!

        // Animate the view the same way the keyboard animates
        let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
            // Update Constraints
            self?.scrollView.layoutIfNeeded()
//            self?.view.layoutIfNeeded()
        }

        // Perform the animation
        animator.startAnimation()
    }

    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        // write source code handle when keyboard will be hidden
//        let inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        scrollView.contentInset = inset

        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - keyboardSize.height)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
