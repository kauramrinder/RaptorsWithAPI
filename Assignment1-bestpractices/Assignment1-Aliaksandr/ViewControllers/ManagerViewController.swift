//
//  ManagerViewController.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {
    
    var history : History?
    var inventory: Inventory?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showHistory"{
            let historyPanel = segue.destination as! HistoryViewController
            historyPanel.history = history!.purchases
        }
        
        if segue.identifier == "showReset"{
            print("in segue")
            print(inventory!.tickets.count)
            let resetPanel = segue.destination as! ResetViewController
            resetPanel.tickets = inventory!.tickets
        }
        
        
        
        
    }

}
