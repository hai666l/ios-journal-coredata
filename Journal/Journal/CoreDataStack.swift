//
//  CoreDataStack.swift
//  Journal
//
//  Created by conner on 4/22/20.
//  Copyright © 2020 conner. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    // This is a shared instance of the CoreDataStack
    static let shared = CoreDataStack()

    lazy var container: NSPersistentContainer = {

        // "Tasks" needs to be named what the .xcdatamodeld file is named
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { (_ , error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

}
