//
//  ContactRepository.swift
//  OpenContact
//
//  Created by Bertrand BLOC'H on 11/11/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

final class ContactRepository {

    // MARK: - Properties

    private let coreDataStack: CoreDataStack

    // MARK: - Init

    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Repository

    func getContacts(completion: ([Contact]) -> Void) {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        do {
            let persons = try coreDataStack.viewContext.fetch(request)
            completion(persons)
        } catch {
            completion([])
        }
    }

    func saveContact(lastName: String, firstName: String, phone: String, completion: () -> Void) {
        let contact = Contact(context: coreDataStack.viewContext)
        contact.lastName = lastName
        contact.firstName = firstName
        contact.phone = phone
        do {
            try coreDataStack.viewContext.save()
            completion()
        } catch {
            print("We were unable to save \(lastName)")
        }
    }
}
