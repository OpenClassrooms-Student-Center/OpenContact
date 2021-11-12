//
//  CoreDataStack.swift
//  OpenContact
//
//  Created by Bertrand BLOC'H on 11/11/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {

    // MARK: - Singleton

    static let sharedInstance = CoreDataStack()

    // MARK: - Public

    var viewContext: NSManagedObjectContext {
        return CoreDataStack.sharedInstance.persistentContainer.viewContext
    }

    // MARK: - Private

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "OpenContact")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
