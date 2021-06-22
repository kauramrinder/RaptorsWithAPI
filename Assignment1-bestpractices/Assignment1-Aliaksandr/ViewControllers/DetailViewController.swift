//
//  DetailViewController.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data : Purchase?

    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = data!.type
        lblQuantity.text = "\(data!.amount)"
        lblTotal.text = "\(data!.price)$"
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MMMM d y, HH:mm a"
        lblDate.text = "\(formatter.string(from: data!.date))"
    }
    
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBAction func closeClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
