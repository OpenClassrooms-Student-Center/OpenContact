//
//  AddContactViewController.swift
//  OpenContact
//
//  Created by Bertrand BLOC'H on 11/11/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import UIKit

final class AddContactViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    // MARK: - Actions

    @IBAction func save() {
        let lastName = lastNameTextField.text
        let firstName = firstNameTextField.text
        let phone = phoneTextField.text

        // TODO : save contact to database

        navigationController?.popViewController(animated: true)
    }
}

extension AddContactViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if lastNameTextField.isFirstResponder {
            firstNameTextField.becomeFirstResponder()
        } else if firstNameTextField.isFirstResponder {
            phoneTextField.becomeFirstResponder()
        } else {
            save()
        }
        return true
    }

    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        lastNameTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
}
