//
//  ContactsTableViewController.swift
//  OpenContact
//
//  Created by Ambroise COLLON on 08/10/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    // MARK: - Properties

    private let repository = ContactRepository()
    private var contacts: [Contact] = []

    // MARK: - View life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getContacts()
    }

    // MARK: - Private

    private func getContacts() {
        repository.getContacts(completion: { [weak self] contacts in
            self?.contacts = contacts
            self?.tableView.reloadData()
        })
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let contact = contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName ?? "") \(contact.lastName ?? "")"
        cell.detailTextLabel?.text = contact.phone

        return cell
    }
}
