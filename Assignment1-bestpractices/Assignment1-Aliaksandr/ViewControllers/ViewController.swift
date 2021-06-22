//
//  ViewController.swift
//  Assignment1-Aliaksandr
//
//  Created by user182483 on 10/14/20.Amrinder Kaur
//  Copyright © 2020 user182483. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var ticketType: UILabel!
    var items = [Course]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        //let ticket = inventory!.tickets[row]
        let item = items[row]
        return "\(item.type) \(item.amount) Price is: \(item.price)$"
    }
    
    
    var inventory : Inventory?
    var history : History?

    override func viewDidLoad() {
        super.viewDidLoad()
        ticketType.text = selectedTicket().type
        total.text = "0$"
        fetchData()
    }
    
    func fetchData(){
        let manager = JSONManager()
        manager.fetchJSONData{
            (student) in
            DispatchQueue.main.async {
                self.items = student.data
                self.title = "Toronto Raptor's Ticket App"
                self.tickets.reloadAllComponents()
            }
        }
    }
    
    func updateTotal(){
        if quantity.text! != "" {
            let amount = Double(quantity.text!)!
            let price = selectedTicket().price * amount
            total.text = "\(price)$"
        }
    }
    
    
    @IBAction func btnClearClicked(_ sender: UIButton) {
        quantity.text! = ""
        total.text! = "0$"
    }
    
    func selectedTicket() -> Ticket{
        return inventory!.tickets[ tickets.selectedRow(inComponent: 0)]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        ticketType.text = selectedTicket().type
        updateTotal()
    }

    @IBOutlet weak var tickets: UIPickerView!
    
    @IBAction func digitPressed(_ sender: UIButton) {
        quantity.text! += sender.currentTitle!
        updateTotal()
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        let amount = Int(quantity.text!)!
        let totalPrice = Double(total.text!.dropLast())!
        
        if selectedTicket().buyTicket(q: amount){
            history!.addPurchase(purchase: Purchase(t: selectedTicket().type, p: totalPrice, a: amount))
            
            tickets.reloadAllComponents()
            quantity.text=""
            total.text="0$"
        }
        else{
            let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let alert = UIAlertController(title: "Error", message: "Not enough tickets", preferredStyle: .alert)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerPanel = segue.destination as! ManagerViewController
        managerPanel.inventory = inventory
        managerPanel.history = history
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tickets.reloadAllComponents()
    }
    
    
}

