//
//  AddContactViewController.swift
//  OpenContact
//
//  Created by Ambroise COLLON on 08/10/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

final class AddContactViewController: UIViewController {

    // MARK: - Properties

    private let repository = ContactRepository()

    // MARK: - Outlets

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    // MARK: - Actions

    @IBAction func save() {
        saveContact()
    }

    // MARK: - Private

    private func saveContact() {
        guard
            let lastName = lastNameTextField.text,
            let firstName = firstNameTextField.text,
            let phone = phoneTextField.text
        else { return }

        if lastName.isEmpty || firstName.isEmpty || phone.isEmpty {
            print("Un champs obligatoire est vide")
            return
        }

        repository.saveContact(
            lastName: lastName,
            firstName: firstName,
            phone: phone,
            completion: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
    }
}

private extension AddContactViewController: UITextFieldDelegate {
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
