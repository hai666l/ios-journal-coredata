//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by conner on 4/22/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "EntryCell"
    
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var entryPreview: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        // Place values of Entry into outlets
        title.text = entry?.title
        timestamp.text = "\(String(describing: entry?.timestamp))"
        entryPreview.text = entry?.bodyText
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
