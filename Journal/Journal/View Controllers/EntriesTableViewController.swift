//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by conner on 4/22/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    var entries: [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        let ctx = CoreDataStack.shared.mainContext
        do {
            return try ctx.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching entries: \(error)")
            return []
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryTableViewCell
        
        cell.entry = entries[indexPath.row]
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = entries[indexPath.row]
            let ctx = CoreDataStack.shared.mainContext
            ctx.delete(entry)
            do {
                try ctx.save()
            } catch {
                NSLog("Error saving after deleting context: \(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
