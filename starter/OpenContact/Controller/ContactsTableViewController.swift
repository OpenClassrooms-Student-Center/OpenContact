//
//  TableViewController.swift
//  OpenContact
//
//  Created by Bertrand BLOC'H on 11/11/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import UIKit

final class ContactsTableViewController: UITableViewController {

    // MARK: - Properties

    // TODO : ad properties to fetch data from database and keep them localy in a collection

    // MARK: - View life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO : replace with correct value from database
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        // TODO : replace with correct values from database
        cell.textLabel?.text = "Prénom Nom"
        cell.detailTextLabel?.text = "0612345678"

        return cell
    }
}
