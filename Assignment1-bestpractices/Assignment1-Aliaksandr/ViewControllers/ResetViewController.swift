//
//  ResetViewController.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/21/20.
//  Copyright © 2020 user182483. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var tickets : [Ticket]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))

        view.addGestureRecognizer(tap)
    }
    
    @IBOutlet weak var txtAmount: UITextField!
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        txtAmount.text = ""
    }
    
    @IBAction func okClicked(_ sender: Any) {
        if let newAmount = Int(txtAmount.text!){
        tickets![pvTickets.selectedRow(inComponent: 0)].reset(q: newAmount)
            pvTickets.reloadAllComponents()
            self.view.endEditing(true)
        }
        
        
    }
    @IBOutlet weak var pvTickets: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tickets!.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        let ticket = tickets![row]
        return "\(ticket.type) \(ticket.amount) Price: \(ticket.price)$"
    }

}
