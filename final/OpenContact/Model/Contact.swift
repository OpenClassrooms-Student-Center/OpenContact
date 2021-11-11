//
//  File.swift
//  OpenContact
//
//  Created by Ambroise COLLON on 08/10/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

class Contact: NSManagedObject {
    static var all: [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        guard let contacts = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return contacts
    }
}
