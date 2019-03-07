//
//  KataTableViewCell.swift
//  IaidoTracker
//
//  Created by Martin Pittenauer on 3/6/19.
//  Copyright © 2019 Martin Pittenauer. All rights reserved.
//

import UIKit

class KataTableViewCell: UITableViewCell {

    @IBOutlet weak var kataNameTitleLabel: UILabel!
    var kataNameIdentifier: String!
    @IBOutlet weak var kataCountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperAction(sender: AnyObject) {
        // Update Core Data
        let katas = Katas.sharedInstance
        katas.setCounter(forKataWith: self.kataNameIdentifier, to: Int(self.stepper.value))
        (self.superview as! UITableView).reloadData()
        //self.kataCountLabel?.text = "\(Int(self.stepper.value))"
    }

}
