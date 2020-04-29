//
//  Entry+Convenience.swift
//  Journal
//
//  Created by conner on 4/22/20.
//  Copyright © 2020 conner. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(title: String,
                     bodyText: String,
                     timestamp: Date = NSDate.now,
                     identifier: UUID = UUID(),
                     context: NSManagedObjectContext) {
        
        self.init(context: context)
        
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
    }
}

