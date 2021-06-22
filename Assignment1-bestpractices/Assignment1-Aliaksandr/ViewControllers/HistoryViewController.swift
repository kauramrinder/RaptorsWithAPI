//
//  HistoryViewController.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history : [Purchase]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var historyTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = history![indexPath.row].type
        cell.detailTextLabel?.text = "\( history![indexPath.row].amount)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in segue")
        let dvc = segue.destination as! DetailViewController
        let index = historyTable.indexPathForSelectedRow?.row
        dvc.data = history![index!]
    }
    
}
