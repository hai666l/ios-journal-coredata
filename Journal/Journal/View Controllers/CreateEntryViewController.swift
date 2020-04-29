//
//  CreateEntryViewController.swift
//  Journal
//
//  Created by conner on 4/22/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var entryTF: UITextField!
    @IBOutlet weak var entryTV: UITextView!
    

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
         navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let title = entryTF.text, !title.isEmpty,
            let entryText = entryTV.text, !entryText.isEmpty
            else { return }
        
        Entry(title: title, bodyText: entryText, context: CoreDataStack.shared.mainContext)
        do {
            try CoreDataStack.shared.mainContext.save()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch {
            NSLog("Error saving managed object context \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
