//
//  DetailsViewController.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 25/12/22.
//

import UIKit

protocol DetailsViewControllerDelegate: AnyObject {
    func showAlert(message: String)
}

class DetailsViewController: UIViewController {

    var delegate: DetailsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail Page"

    }
    @IBAction func doneAction(_ sender: Any) {
        self.performDelegationAction()
    }

    func performDelegationAction(){
        self.navigationController?.popViewController(animated: true)
        self.delegate?.showAlert(message: "Happy Christmas 🎅🏻🎅🏼🎄🎄")
    }
}
